within ChaoticCircuits.Components;
model RotationalEMF "Electromotoric force (electric/mechanic transformer)"
  parameter SI.MutualInductance M(start=1) "Mutual inductance";
  SI.Voltage v = pa.v - na.v "Voltage drop between the armature pins";
  SI.Current i(start=0) = pa.i "Current flowing from positive to negative armature pin";
  SI.Angle phi(start=0, fixed=true) = flange.phi "Angle of flange";
  SI.AngularVelocity w(start=0) = der(phi) "Angular velocity of flange";
  SI.Torque tau = -flange.tau "Electrical torque";
  Modelica.Electrical.Analog.Interfaces.PositivePin pa "Positive armature pin"
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Interfaces.NegativePin na "Negative armature pin"
    annotation (Placement(transformation(
        origin={0,-100},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft flange" annotation (
      Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput ie(quantity="ElectricCurrent", unit="A")
    "Excitation current" annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
equation
  // current balance
  0  = pa.i + na.i;
  // induced voltage
  v  = M*ie*w;
  // generated torque
  tau = M*ie*i;
  annotation (
    defaultComponentName="emf",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{80,10},{100,-10}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Ellipse(
          extent={{-80,80},{80,-80}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Text(
          extent={{-80,20},{80,-20}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{0,90},{0,80}}, color={0,0,255}),
        Line(points={{0,-80},{0,-90}}, color={0,0,255})}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
            100,100}})),
    Documentation(info="<html>
<p>
EMF transforms electrical energy into rotational mechanical energy. It is used as basic building block of an electrical machine. 
The mechanical connector flange can be connected to elements of the Modelica.Mechanics.Rotational library. 
The magnetic field is excited by the excitation current provided at the input connector <code>ie</code>.
</p>
<h4>Note</h4>
<p>
To obtain the Rikitake equations, the <strong>negative</strong> armature current of the other emf has to be used as excitation current <code>ie</code>.
</p>
</html>",
        revisions="<html>
<ul>
<li><em> 1998   </em>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
end RotationalEMF;

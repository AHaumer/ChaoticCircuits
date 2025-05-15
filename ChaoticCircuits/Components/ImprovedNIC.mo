within ChaoticCircuits.Components;
model ImprovedNIC "Improved model of a negative impedance converter"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  SI.Current i=p.i "Current flowing at pin p into the component";
  SI.Current ineg(start=0)=n.i "Current flowing at pin n out of the component";
  replaceable parameter ParameterSets.NICData nicData
    constrainedby ChaoticCircuits.ParameterSets.NICData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Electrical.Analog.Basic.Resistor rPos(R=nicData.R)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-30,22})));
  ImprovedOpAmp3Pin opAmp(
    V0=nicData.V0,
    Vps=+nicData.Vs,
    Vns=-nicData.Vs) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,22})));
  Modelica.Electrical.Analog.Basic.Resistor rNeg(R=nicData.R)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,22})));
  Modelica.Electrical.Analog.Basic.Resistor rg(R=nicData.Rg)
                                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,0})));
equation
  connect(rPos.p, opAmp.out) annotation (Line(points={{-30,32},{-30,40},{0,40},{
          0,32}}, color={0,0,255}));
  connect(rPos.n, opAmp.in_p) annotation (Line(points={{-30,12},{-30,0},{-6,0},{
          -6,12}}, color={0,0,255}));
  connect(opAmp.in_p, p)
    annotation (Line(points={{-6,12},{-6,0},{-100,0}}, color={0,0,255}));
  connect(opAmp.in_n, rNeg.n)
    annotation (Line(points={{6,12},{6,0},{30,0},{30,12}}, color={0,0,255}));
  connect(opAmp.out, rNeg.p)
    annotation (Line(points={{0,32},{0,40},{30,40},{30,32}}, color={0,0,255}));
  connect(opAmp.in_n, rg.p)
    annotation (Line(points={{6,12},{6,0},{50,0}}, color={0,0,255}));
  connect(rg.n, n) annotation (Line(points={{70,0},{100,0}}, color={0,0,255}));
  annotation (Icon(graphics={
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={255,0,128},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-60,-40},{-30,20},{30,-20},{60,40}},
                                                         color={255,0,128}),
        Line(points={{80,0},{80,-20}}, color={0,0,255}),
        Line(
          points={{0,10},{0,-10}},
          color={0,0,255},
          origin={80,-20},
          rotation=90),
        Line(
          points={{0,2},{0,-10}},
          color={0,0,255},
          origin={76,-24},
          rotation=90),
        Line(
          points={{0,-2},{0,-6}},
          color={0,0,255},
          origin={76,-28},
          rotation=90)}),
      experiment(
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
This is an improved implementation of a Negative Impedance Converter with opAmps. <br>
Note that the opAmp model has to take into account saturation of the output. <br>
Note that p.i + n.i &lt;&gt; 0 due to the active opAmp (with implicit supply) inside!
</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
</p>
</html>"));
end ImprovedNIC;

within ChaoticCircuits.Components;
model IdealChuaDiode "Chua's diode"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  SI.Current i = p.i "Current flwoing at pin p into the component";
  replaceable parameter ParameterSets.ChuaData chuaData
    constrainedby ChaoticCircuits.ParameterSets.ChuaData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,60},{10,80}})));
  IdealNIC idealNIC1(nicData=chuaData.nicData1)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  IdealNIC idealNIC2(nicData=chuaData.nicData2)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
equation
  connect(idealNIC1.n, n) annotation (Line(points={{10,20},{80,20},{80,0},{100,0}},
        color={0,0,255}));
  connect(n, idealNIC2.n) annotation (Line(points={{100,0},{80,0},{80,-20},{10,-20}},
        color={0,0,255}));
  connect(p, p) annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
  connect(p, idealNIC2.p) annotation (Line(points={{-100,0},{-80,0},{-80,-20},{-10,
          -20}}, color={0,0,255}));
  connect(p, idealNIC1.p) annotation (Line(points={{-100,0},{-80,0},{-80,20},{-10,
          20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-170,110},{150,70}},
          textColor={0,0,255},
          textString="%name"),
        Line(points={{-80,-20},{-60,40},{-8,10},{8,-10},{60,-40},{80,20}},
            color={28,108,200})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>This is the only nonlinear component for Chua&#39;s circuit. It is a piecewise linear resistor with both an inner and an outer range, which includes the inner one. The slopes of both ranges are given by parameters. The resistance characteristic is continuous. For Chua&#39;s circuit both slopes have to be chosen to be negative.</p>
<p>This model is an extension: The peak voltage due to saturation of an implementation with 2 opAmps is taken into account. Outside peak voltage, the slope is positive.</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
</p>
</html>"));
end IdealChuaDiode;

within ChaoticCircuits.Components;
model ImprovedChuaDiode "Chua's diode"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  SI.Current i = p.i "Current flwoing at pin p into the component";
  replaceable parameter ParameterSets.ChuaData chuaData
    constrainedby ChaoticCircuits.ParameterSets.ChuaData
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,60},{10,80}})));
  ImprovedNIC improvedNIC1(nicData=chuaData.nicData1)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  ImprovedNIC improvedNIC(nicData=chuaData.nicData2)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
equation
  connect(p, p) annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
  connect(p, improvedNIC.p) annotation (Line(points={{-100,0},{-80,0},{-80,-20},
          {-10,-20}}, color={0,0,255}));
  connect(p, improvedNIC1.p) annotation (Line(points={{-100,0},{-80,0},{-80,20},
          {-10,20}}, color={0,0,255}));
  connect(n, improvedNIC1.n) annotation (Line(points={{100,0},{80,0},{80,20},{10,
          20}}, color={0,0,255}));
  connect(n, improvedNIC.n) annotation (Line(points={{100,0},{80,0},{80,-20},{10,
          -20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(extent={{-70,30},{70,-30}}, lineColor={255,0,128},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-170,110},{150,70}},
          textColor={0,0,255},
          textString="%name"),
        Line(points={{-80,-20},{-60,40},{-8,10},{8,-10},{60,-40},{80,20}},
            color={255,0,128})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p>
This is an improved implementation of Chua&#39;s diode, based on 2 <a href=\"modelica://ChaoticCircuits.Components.ImprovedNIC\">imporved NIC models</a> with opAmps.<br>
Note: This is a demonstration how to realize a piecewise linear characteristic with opAmps / NICs.
</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
</p>
</html>"));
end ImprovedChuaDiode;

within ChaoticCircuits.Components;
model IdealNIC "Ideal model of a negative impedance converter"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter SI.Voltage Vs=15 "Supply voltage";
  parameter SI.Resistance R=4700 "NIC pos and neg feedback resistance";
  parameter SI.Resistance Rg=6800 "NIC resistance to ground";
  parameter SI.Voltage VLim=Vs*Rg/(Rg + R) "Left and right corner voltage"
    annotation(Dialog(group="Results"));
  parameter SI.Current ILim=VLim/Rg "Left and right corner current"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gPos=1/R "Positive differential conductance"
    annotation(Dialog(group="Results"));
  parameter SI.Conductance gNeg=-1/Rg "Negative differential conductance"
    annotation(Dialog(group="Results"));
equation
  i=if v<-VLim then ILim + gPos*(v + VLim) elseif v>+VLim then -ILim + gPos*(v - VLim) else gNeg*v;
  annotation (Icon(graphics={
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-60,-40},{-30,20},{30,-20},{60,40}},
                                                         color={28,108,200})}),
      experiment(
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>This is a simple algebraic model of a Negative Impedance Converter.</p>
<h4>Note:</h4>
<p>
If voltage v is prescribed, the current i can be unambiguously determined.<br>
If current i is prescribed, in the range between the zero crossings the voltage v has 2 or 3 possible solutions. 
</p>
</html>"));
end IdealNIC;

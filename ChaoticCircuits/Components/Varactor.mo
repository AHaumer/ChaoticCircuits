within ChaoticCircuits.Components;
model Varactor "Varactor diode"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(v(start=0));
  parameter SI.Current Ids=5e-6 "Diode: saturation current";
  parameter SI.Voltage nVt=2*26e-3 "Diode: n * voltage equivalent of temperature";
  parameter SI.Capacitance C0=32e-12 "Capacitance at v=0";
  parameter SI.Voltage V0=0.2 "Reference voltage for capacitance";
  parameter Real m=0.3;
  SI.Current id "Diode current";
  SI.Current ic "Capacitor current";
  SI.ElectricCharge q(start=0) "Charge of capacitor";
  SI.Capacitance C "Actual capacitance";
equation
  i = id + ic;
  id = Ids*(exp(v/nVt) - 1);
  ic = der(q);
  q = C*v;
  C = C0*smooth(1, if noEvent(v<0) then 1/(1 - v/V0)^m else 1 + m*v/V0);
  annotation (defaultComponentName="diode",
    Icon(graphics={
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{-90,0},{-30,0}},color={0,0,255}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Line(points={{30,40},{30,-40}}, color={0,0,255}),
        Polygon(
          points={{30,0},{-30,40},{-30,-40},{30,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{40,40},{40,-40}}, color={0,0,255})}),
    Documentation(info="<html>
<p>This is a simple model of a diode with Shockley equation in parallel to a varying capacitance.</p>
</html>"));
end Varactor;

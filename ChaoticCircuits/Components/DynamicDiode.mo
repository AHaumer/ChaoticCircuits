within ChaoticCircuits.Components;
model DynamicDiode
  "Dynamic diode model including junction and diffusion capacitance"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(v(start=0));
  parameter SI.Current Ids=70e-12 "Saturation current";
  parameter SI.Voltage nVt=1.4*25e-3 "n * voltage equivalent of temperature";
  parameter SI.Capacitance C0=33e-12 "Junction capacitance at v=0";
  parameter SI.Voltage V0=0.35 "Voltage parameter for junction capacitance";
  parameter Real m=0.45 "Exponent parameter of junction capacitance";
  parameter Real fc(final min=0, final max=0.99)=0.5
    "Parameter of linear extrapolation of junction capacitance";
  parameter SI.Time TauT=5000e-9 "Transition time";
  SI.Current id "Diode current";
  SI.Current ic "Capacitive current";
  SI.ElectricCharge q "Charge of capacitor";
  SI.Capacitance Cj "Junction capacitance";
  SI.Capacitance Cd "Diffusion capacitance";
equation
  i = id + ic;
  id = Ids*(exp(v/nVt) - 1);
  ic = der(q);
  q = (Cj + Cd)*v;
  Cj = C0*smooth(1, if v<fc*V0 then 1/(1 - v/V0)^m else (1 - fc*(1 + m) + m*v/V0)/((1 - fc)^(1 + m)));
  Cd = TauT*Ids/nVt*exp(v/nVt);
  annotation (Icon(graphics={
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
<p>This is a dynamic diode model:</p>
<ul>
<li>Shockley-equation</li>
<li>Junction capacitance</li>
<li>Diffusion capacitance</lI>
</ul>
<h4>Note:</h4>
<p>
This model might not be suited for all experiments i.e. boundary conditions, but it works as expected for the RLD - circuit.
</p>
</html>"));
end DynamicDiode;

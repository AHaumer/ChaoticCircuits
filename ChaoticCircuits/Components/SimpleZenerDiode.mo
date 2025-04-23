within ChaoticCircuits.Components;
model SimpleZenerDiode "Based on i(v) with 2 knees"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  import Modelica.Constants.inf;
  parameter SI.Resistance Ron(final min=0) = 1e-5
    "Forward state-on differential resistance (closed resistance)";
  parameter SI.Conductance Goff(final min=0) = 1e-5
    "Backward state-off conductance (opened conductance)";
  parameter SI.Voltage Vknee(final min=0) = 0
    "Forward threshold voltage";
  parameter SI.Voltage V_bt(final max=0) = -inf
    "Backward break-through voltage";
  parameter SI.Resistance R_bt(final min=0) = 1e-5
    "Backward differential resistance after break-through";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;
  Boolean on(start=false) "Indicates forward on-state";
  Boolean bt(start=false) "Indicates break-through";
equation
  /*
    // s < 0: s=v below knee point, blocking
    // s > 0: s=i above knee point, conducting
    off = s < 0;
    v = s*(if off then unitVoltage else Ron*unitCurrent) + Vknee;
    i = s*(if off then Goff*unitVoltage else unitCurrent) + Goff*Vknee;
  */
  on = v > Vknee;
  bt = v < V_bt;
  v = if on then (Vknee + Ron*(i - Vknee*Goff))
      else (if bt then (V_bt + R_bt*(i - V_bt*Goff)) else (i/Goff));
  LossPower = v*i;
  annotation (defaultComponentName="diode",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{30,40},{30,-40}}, color={0,0,255}),
        Line(points={{30,-40},{20,-40}}, color={28,108,200}),
        Line(points={{40,0},{90,0}}, color={0,0,255}),
        Line(points={{-90,0},{40,0}}, color={0,0,255}),
        Polygon(
          points={{30,0},{-30,40},{-30,-40},{30,0}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-100,-50},{100,-80}},
          textColor={28,108,200},
          textString="V_bt=%V_bt")}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The Zener-diode is modeled with 3 linear pieces: 
</p>
<ul>
  <li>forward</li>
  <li>blocking</li>
  <li>break-through</li>
</ul>
<table border=\"0\" cellspacing=\"0\" cellpadding=\"2\">
  <tr>
    <td>
      <img src=\"modelica://ChaoticCircuits/Resources/Images/Zdiode.png\">
    </td>
</table>
</html>"));
end SimpleZenerDiode;

within ChaoticCircuits.Components;
model SimpleTransistor "Simple small-signal npn-model"
  parameter Real beta=200 "Transistor forward current gain";
  parameter SI.Voltage VY=100 "Early voltage collector-emitter";
  parameter SI.Voltage Vth=0.75 "Transistor base-emitter threshold voltage";
  parameter SI.Resistance rBE=100 "Small-signal on-resistance of base-emitter junction";
  SI.Current iB=B.i "Base current into the transistor";
  SI.Current iC=C.i "Collector current into the transistor";
  SI.Current iE=-E.i "Emitter current out of the transistor";
  SI.Voltage vBE=B.v - E.v "Base-emitter voltage";
  SI.Voltage vCE=C.v - E.v "Collector-emitter voltage";
  Modelica.Electrical.Analog.Interfaces.Pin C "Collector"
    annotation (Placement(transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin B "Base"
    annotation (Placement(transformation(extent={{-90,-10},{-110,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin E "Emitter"
    annotation (Placement(transformation(extent={{90,-50},{110,-70}}), iconTransformation(extent={{90,-50},{110,-70}})));
equation
  iE = iC + iB;
  //simplified (linearized) BE-diode characteristic
  iB = if vBE<=Vth then 0 else (vBE - Vth)/rBE;
  //current amplification and saturation (avoid division by vBE=0), but no further dependency on vCE
  iC = beta*iB*max(0, min(1, vCE/max(vBE, Vth))) + (if vCE > vBE then (vCE - vBE)*beta*iB/(VY + Vth) else 0);
  annotation (defaultComponentName="npn",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(extent={{-80,80},{80,-80}}, lineColor={28,108,200}),
        Line(points={{0,0},{-90,0}},    color={0,0,255}),
        Line(points={{0,40},{0,-40}},     color={0,0,255}),
        Line(points={{40,60},{0,20}},   color={0,0,255}),
        Line(points={{0,-20},{40,-60}},   color={0,0,255}),
        Polygon(
          points={{40,-60},{34,-46},{26,-54},{40,-60}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{40,-60},{101,-60}},color={0,0,255}),
        Line(points={{40,60},{101,60}},  color={0,0,255}),
        Text(
          extent={{-70,30},{-50,10}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{40,50},{60,30}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{40,-30},{60,-50}},
          textColor={28,108,200},
          textString="E"),
        Text(     extent={{-150,140},{150,100}},
          textString="%name",
    textColor={0,0,255})}),                                      Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>This is a simple small signal model of a npn transistor according to the following equations:</p>
<p>Simplified (linearized) Shockley-equation</p>
<code>R<sub>on</sub>*i<sub>B</sub> = if v<sub>BE</sub>&le;V<sub>th</sub> then 0 else (v<sub>BE</sub> - V<sub>th</sub>)</code>
<p>Ebers-Moll-equation</p>
<code>i<sub>C</sub> = &beta;*i<sub>B</sub></code><br>
<p>For v<sub>CE</sub>&lt;v<sub>BE</sub> saturation of i<sub>C</sub> is taken into account (linearly to 0).</p>
<p>For v<sub>CE</sub>&gt;v<sub>BE</sub> the slope of i<sub>C</sub> is taken into account (Early voltage VY).</p>
</html>"));
end SimpleTransistor;

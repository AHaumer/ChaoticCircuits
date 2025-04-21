within ChaoticCircuits.Components;
model SimpleTransistor "Simple npn-model"
  parameter Real beta=200 "Transistor forward current gain";
  parameter SI.Voltage Vth=0.75 "Transistor base-emitter threshold voltage";
  parameter SI.Resistance Ron=100 "Small-signal on-resistance of base-emitter junction";
  SI.Current iB=B.i "Base current into the transistor";
  SI.Current iC=C.i "Collector current into the transistor";
  SI.Current iE=E.i "Emitter current into the transistor";
  SI.Voltage vBE=B.v - E.v "Base-emitter voltage";
  SI.Voltage vCE=C.v - E.v "Collector-emitter voltage";
  Modelica.Electrical.Analog.Interfaces.Pin C "Collector"
    annotation (Placement(transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin B "Base"
    annotation (Placement(transformation(extent={{-90,-10},{-110,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin E "Emitter"
    annotation (Placement(transformation(extent={{90,-50},{110,-70}}), iconTransformation(extent={{90,-50},{110,-70}})));
equation
  iB + iC + iE = 0;
  iC = beta*iB;
  iB = if vBE<=Vth then 0 else (vBE - Vth)/Ron;
  annotation (defaultComponentName="npn",
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-10,0},{-90,0}},  color={0,0,255}),
        Line(points={{-10,40},{-10,-40}}, color={0,0,255}),
        Line(points={{40,60},{-10,10}}, color={0,0,255}),
        Line(points={{-10,-10},{40,-60}}, color={0,0,255}),
        Polygon(
          points={{40,-60},{34,-46},{26,-54},{40,-60}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),
        Line(points={{40,-60},{101,-60}},color={0,0,255}),
        Line(points={{40,60},{101,60}},  color={0,0,255}),
        Text(
          extent={{-80,20},{-60,0}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{60,80},{80,60}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{60,-60},{80,-80}},
          textColor={28,108,200},
          textString="E"),
        Text(     extent={{-150,140},{150,100}},
          textString="%name",
    textColor={0,0,255}),
        Ellipse(extent={{-80,80},{80,-80}}, lineColor={28,108,200})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SimpleTransistor;

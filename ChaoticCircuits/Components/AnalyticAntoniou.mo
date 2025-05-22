within ChaoticCircuits.Components;
model AnalyticAntoniou "Analytic Antoniou simulated inductance"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance R1=100 "Inductor replacement R1";
  parameter SI.Resistance R2=1.e3 "Inductor replacement R2";
  parameter SI.Resistance R3=1.e3 "Inductor replacement R3";
  parameter SI.Resistance R4=L*R2/(C*R1*R3) "Inductor replacement R4";
  parameter SI.Capacitance C=100e-9 "Inductor replacement C";
  SI.Current i_p=+p.i;
  SI.Current i_n=-n.i;
  SI.Current i1;
  SI.Current i2;
  SI.Voltage vc(start=0);
equation
  R1*i_p + R2*(i_p + i2) = 0;
  R3*(i_p + i2) + vc = 0;
  i_n = i_p + i2 + i1;
  i_n = C*der(vc);
  v = R4*i_n;
  annotation (Icon(graphics={
        Line(points={{-15,0},{15,0}},color={0,140,72},
          origin={75,0},
          rotation=180),
        Line(points={{-90,0},{-60,0}}, color={0,140,72}),
        Line(
          points={{-60,0},{-59,6},{-52,14},{-38,14},{-31,6},{-30,0}},
          color={0,140,72},
          smooth=Smooth.Bezier),
        Line(
          points={{-30,0},{-29,6},{-22,14},{-8,14},{-1,6},{0,0}},
          color={0,140,72},
          smooth=Smooth.Bezier),
        Line(
          points={{0,0},{1,6},{8,14},{22,14},{29,6},{30,0}},
          color={0,140,72},
          smooth=Smooth.Bezier),
        Line(
          points={{30,0},{31,6},{38,14},{52,14},{59,6},{60,0}},
          color={0,140,72},
          smooth=Smooth.Bezier),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          textColor={0,0,255}),
        Line(points={{80,0},{80,-20}}, color={0,0,255}),
        Line(
          points={{0,10},{0,-10}},
          color={0,0,255},
          origin={80,-20},
          rotation=90),
        Line(
          points={{0,6},{0,-6}},
          color={0,0,255},
          origin={80,-26},
          rotation=90),
        Line(
          points={{0,2},{0,-2}},
          color={0,0,255},
          origin={80,-32},
          rotation=90)}),         Documentation(info="<html>
<p>
This is an analytic model of the Antoniou circuit of a simulated inductance according to ideal operational amplifiers:
</p>
<ul>
  <li>Input currntes are zero.</li>
  <li>Differential input voltage is zero.</li>
  <li>No-load voltage gain is infinite.</li>
  <li>No output saturation</li>
</ul>
<h4>Note:</h4>
<p>Has to be grounded at pin n!</p>
<p>References:</p>
<p>Adel S. Sedra and Kenneth C. Smith, Microelectronic Circuits, Oxford University Press 2015, 7<sup>th</sup> ed., ISBN 978–0–19–933913–6</p>
<p>A. Antoniou, Realisation of Gyrators Using Op-Amps and Their Use in RC Active Network Synthesis, Proceedings of the IEEE, Vol. 116, 1969, pp. 1838-1850</p>
</html>"));
end AnalyticAntoniou;

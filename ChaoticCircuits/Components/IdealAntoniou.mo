within ChaoticCircuits.Components;
model IdealAntoniou "Ideal Antoniou simulated inductance"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance R1=100 "Inductor replacement R1";
  parameter SI.Resistance R2=1.e3 "Inductor replacement R2";
  parameter SI.Resistance R3=1.e3 "Inductor replacement R3";
  parameter SI.Resistance R4=L*R2/(C*R1*R3) "Inductor replacement R4";
  parameter SI.Capacitance C=100e-9 "Inductor replacement C";
  SI.Current i_p=+p.i;
  SI.Current i_n=-n.i;
  SI.Voltage vc(start=0)=c.v;
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-30})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp2 annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={20,30})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,0})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  Modelica.Electrical.Analog.Basic.Resistor r3(R=R3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={2,0})));
  Modelica.Electrical.Analog.Basic.Capacitor c(C=C)  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,0})));
  Modelica.Electrical.Analog.Basic.Resistor r4(R=R4) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,0})));
equation
  connect(p, r1.p)
    annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
  connect(r1.n, r2.p)
    annotation (Line(points={{-60,0},{-40,0}}, color={0,0,255}));
  connect(r2.n, r3.p)
    annotation (Line(points={{-20,0},{-8,0}}, color={0,0,255}));
  connect(r3.n, c.p) annotation (Line(points={{12,0},{30,0}}, color={0,0,255}));
  connect(c.n, r4.p) annotation (Line(points={{50,0},{60,0}}, color={0,0,255}));
  connect(r4.n, n) annotation (Line(points={{80,0},{100,0}}, color={0,0,255}));
  connect(r1.p, opAmp1.in_p) annotation (Line(points={{-80,0},{-80,-10},{-56,-10},
          {-56,-20}}, color={0,0,255}));
  connect(opAmp1.in_n, r2.n) annotation (Line(points={{-44,-20},{-44,-12},{-20,-12},
          {-20,0}}, color={0,0,255}));
  connect(r3.p, opAmp2.in_n) annotation (Line(points={{-8,0},{-8,10},{14,10},{14,
          20}}, color={0,0,255}));
  connect(c.n, opAmp2.in_p) annotation (Line(points={{50,0},{50,10},{26,10},{26,
          20}}, color={0,0,255}));
  connect(r1.n, opAmp2.out) annotation (Line(points={{-60,0},{-48,0},{-48,50},{20,
          50},{20,40}}, color={0,0,255}));
  connect(opAmp1.out, c.p) annotation (Line(points={{-50,-40},{-50,-50},{20,-50},
          {20,0},{30,0}}, color={0,0,255}));
  annotation (Icon(graphics={
        Line(points={{60,0},{90,0}}, color={0,0,255}),
        Line(points={{-90,0},{-60,0}}, color={0,0,255}),
        Line(
          points={{-60,0},{-59,6},{-52,14},{-38,14},{-31,6},{-30,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{-30,0},{-29,6},{-22,14},{-8,14},{-1,6},{0,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{0,0},{1,6},{8,14},{22,14},{29,6},{30,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),
        Line(
          points={{30,0},{31,6},{38,14},{52,14},{59,6},{60,0}},
          color={0,0,255},
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
This is a model of the Antoniou circuit of a simulated inductance using operational amplifiers.
Taking into account that input currents as well as differential input voltages of the opAmps are neglectible, the circuit acts like an inductance. 
</p>
<h4>Note:</h4>
<p>Has to be grounded at pin n!</p>
</html>"));
end IdealAntoniou;

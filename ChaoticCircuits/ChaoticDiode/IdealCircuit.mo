within ChaoticCircuits.ChaoticDiode;
model IdealCircuit  "A simple chaotic circuit with a light-emitting diode"
  extends Modelica.Icons.Example;
  //diode
  parameter SI.Current Ids=1e-9 "Diode: saturation current";
  parameter SI.Voltage nVt=2*26e-3 "Diode: n * voltage equivalent of temperature";
  //time constant and dimensionless parameters
  parameter SI.Time Tau=0.1e-3 "Time constant";
  parameter Real a=1/5200 "Parameter a = Ra*Ids/nVt";
  parameter Real b=1.5 "Parameter b = R/Rb";
  //configuration of the opAmps
  parameter SI.Capacitance C=10e-9 "Capacitance of {c1, c2, c3}";
  parameter SI.Resistance R=Tau/C "Resistance of {r1, r2, r3, r4}";
  parameter SI.Resistance Ra=a*nVt/Ids "Resistance of ra";
  parameter SI.Resistance Rb=R/b "Resistance of rb";
  //shortcuts to results
  Real x[3]={c1.v, c2.v, c3.v}/nVt "Result vector {c1, c2, c3}.v/nVt";
  //initialization
  parameter Real x0[3]={0, 0.1, 0} "Initial value of result vector";
  SI.Voltage vd(start=0)=diode.vd "Voltage of diode";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp1
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Electrical.Analog.Basic.Capacitor c1(v(fixed=true, start=x0[1]*nVt), C=C)
    annotation (Placement(transformation(extent={{10,50},{-10,70}})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp2
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Electrical.Analog.Basic.Capacitor c2(v(fixed=true, start=x0[2]*nVt), C=C)
    annotation (Placement(transformation(extent={{-40,-30},{-60,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{-70,-80},{-50,-60}})));
  Modelica.Electrical.Analog.Semiconductors.Diode2 diode(Ids=Ids, Vt=nVt, Vf=0.8, Rs=1e-6)
    annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp3
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor c3(v(fixed=true, start=x0[3]*nVt), C=C)
    annotation (Placement(transformation(extent={{80,40},{60,60}})));
  Modelica.Electrical.Analog.Basic.Resistor r31(R=R)
    annotation (Placement(transformation(extent={{30,20},{50,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Electrical.Analog.Basic.Resistor rb(R=Rb)
    annotation (Placement(transformation(extent={{30,40},{50,60}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp4
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor ra(R=Ra)
    annotation (Placement(transformation(extent={{20,-10},{0,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor r34(R=R)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
equation
  connect(ground1.p, opAmp1.in_p)
    annotation (Line(points={{-10,20},{-10,24}},        color={0,0,255}));
  connect(ground2.p, opAmp2.in_p)
    annotation (Line(points={{-60,-60},{-60,-56}},           color={0,0,255}));
  connect(r31.n, opAmp3.in_n)
    annotation (Line(points={{50,30},{60,30},{60,26}}, color={0,0,255}));
  connect(ground3.p, opAmp3.in_p)
    annotation (Line(points={{60,10},{60,14}},         color={0,0,255}));
  connect(ground4.p, opAmp4.in_p)
    annotation (Line(points={{0,-40},{0,-36}},            color={0,0,255}));
  connect(opAmp4.in_n, diode.n) annotation (Line(points={{0,-24},{0,-20},{-10,
          -20}},     color={0,0,255}));
  connect(r34.n, opAmp3.in_n) annotation (Line(points={{50,0},{50,30},{60,30},{
          60,26}}, color={0,0,255}));
  connect(r34.n, r31.n)
    annotation (Line(points={{50,0},{50,30}}, color={0,0,255}));
  connect(rb.n, r31.n)
    annotation (Line(points={{50,50},{50,30}}, color={0,0,255}));
  connect(opAmp3.out, rb.p) annotation (Line(points={{80,20},{90,20},{90,70},{
          20,70},{20,50},{30,50}}, color={0,0,255}));
  connect(opAmp3.out, r2.p) annotation (Line(points={{80,20},{90,20},{90,80},{
          -90,80},{-90,-20}}, color={0,0,255}));
  connect(r1.n, c1.n)
    annotation (Line(points={{-20,60},{-10,60}}, color={0,0,255}));
  connect(c1.n, opAmp1.in_n)
    annotation (Line(points={{-10,60},{-10,36}}, color={0,0,255}));
  connect(c3.n, opAmp3.in_n)
    annotation (Line(points={{60,50},{60,26}}, color={0,0,255}));
  connect(opAmp2.in_n, c2.n)
    annotation (Line(points={{-60,-44},{-60,-20}}, color={0,0,255}));
  connect(c2.n, r2.n)
    annotation (Line(points={{-60,-20},{-70,-20}}, color={0,0,255}));
  connect(opAmp2.out, diode.p) annotation (Line(points={{-40,-50},{-40,-20},{-30,
          -20}},           color={0,0,255}));
  connect(opAmp2.out, c2.p)
    annotation (Line(points={{-40,-50},{-40,-20}}, color={0,0,255}));
  connect(opAmp2.out, r1.p)
    annotation (Line(points={{-40,-50},{-40,60}}, color={0,0,255}));
  connect(opAmp1.out, c1.p)
    annotation (Line(points={{10,30},{10,60}}, color={0,0,255}));
  connect(opAmp1.out, r31.p)
    annotation (Line(points={{10,30},{30,30}}, color={0,0,255}));
  connect(c3.p, opAmp3.out)
    annotation (Line(points={{80,50},{80,20}}, color={0,0,255}));
  connect(ra.p, r34.p)
    annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
  connect(ra.p, opAmp4.out)
    annotation (Line(points={{20,0},{20,-30}}, color={0,0,255}));
  connect(opAmp4.in_n, ra.n)
    annotation (Line(points={{0,-24},{0,0}}, color={0,0,255}));
  annotation (                                 experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"),
    Diagram(graphics={
        Rectangle(
          extent={{-34,4},{24,-58}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}),
                      Line(
          points={{-22,-10},{-18,0}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled}), Line(
          points={{-18,-10},{-14,0}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled}),
        Rectangle(
          extent={{-94,-10},{-36,-76}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}),
        Rectangle(
          extent={{-44,72},{14,10}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}),
        Rectangle(
          extent={{26,62},{84,-8}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}),
                      Line(
          points={{34,40},{46,60}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;

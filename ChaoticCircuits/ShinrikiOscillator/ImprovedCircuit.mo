within ChaoticCircuits.ShinrikiOscillator;
model ImprovedCircuit "Shinriki oscillator"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=320e-3 "Inductor";
  parameter SI.Resistance RL=100. "Resistor of L";
  parameter SI.Resistance R1=60e3 "Resistor 1";
  parameter SI.Resistance R2=20e3 "Resistor 2";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  parameter SI.Voltage Vs=15 "Supply Voltage";
  parameter SI.Resistance RNIC =4700 "NIC feedback resistance";
  parameter SI.Resistance RNICg=6800 "NIC resistance to ground";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)=c1.v "Result 1 c1.v";
  SI.Voltage v2(start=1, fixed=true)=c2.v "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=rL.v "Voltage of inductor's resistance";
  Components.IdealizedOpAmp3Pin                          opAmp(Vps=+Vs, Vns=-Vs)
    annotation (Placement(transformation(extent={{-70,10},{-50,-10}})));
  Modelica.Electrical.Analog.Basic.Resistor rNICp(R=RNIC)
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  Modelica.Electrical.Analog.Basic.Resistor rNICn(R=RNIC)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-90,-90},{-70,-70}})));
  Modelica.Electrical.Analog.Basic.Resistor rNICg(R=RNICg)
                                                          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-50})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Capacitor c1(C=C1) annotation (Placement(
        transformation(extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2)
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Electrical.Analog.Basic.Capacitor c2(C=C2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,0})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
                                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,20})));
  Modelica.Electrical.Analog.Basic.Resistor rL(R=RL) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-20})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode21(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5,
    v(start=0))
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  Modelica.Electrical.Analog.Semiconductors.ZDiode diode22(
    Ids=1e-05,
    Maxexp=5,
    Bv=4.3,
    Ibv=0.001,
    Nbv=5) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={40,40})));
  //initialization
  SI.Current iNICn(start=0)=rNICn.i "Current of resistor rNICn";
equation
  connect(rNICp.n, opAmp.out) annotation (Line(points={{-50,30},{-40,30},{-40,0},
          {-50,0}}, color={0,0,255}));
  connect(rNICp.p, opAmp.in_p) annotation (Line(points={{-70,30},{-80,30},{-80,6},
          {-70,6}}, color={0,0,255}));
  connect(rNICn.n, opAmp.out) annotation (Line(points={{-50,-30},{-40,-30},{-40,
          0},{-50,0}}, color={0,0,255}));
  connect(rNICn.p, opAmp.in_n) annotation (Line(points={{-70,-30},{-80,-30},{-80,
          -6},{-70,-6}}, color={0,0,255}));
  connect(rNICn.p, rNICg.p)
    annotation (Line(points={{-70,-30},{-80,-30},{-80,-40}}, color={0,0,255}));
  connect(rNICg.n, ground.p)
    annotation (Line(points={{-80,-60},{-80,-70}}, color={0,0,255}));
  connect(rL.p, inductor.n)
    annotation (Line(points={{80,-10},{80,10}}, color={0,0,255}));
  connect(ground.p, rL.n)
    annotation (Line(points={{-80,-70},{80,-70},{80,-30}}, color={0,0,255}));
  connect(c2.n, rL.n) annotation (Line(points={{60,-10},{60,-70},{80,-70},{80,-30}},
        color={0,0,255}));
  connect(c1.n, rL.n) annotation (Line(points={{0,-10},{0,-70},{80,-70},{80,-30}},
        color={0,0,255}));
  connect(r1.n, rL.n) annotation (Line(points={{-20,-10},{-20,-70},{80,-70},{80,
          -30}}, color={0,0,255}));
  connect(c2.p, inductor.p) annotation (Line(points={{60,10},{60,50},{80,50},{80,
          30}}, color={0,0,255}));
  connect(c1.p, r2.p) annotation (Line(points={{0,10},{0,50},{10,50},{10,60},{20,
          60}}, color={0,0,255}));
  connect(c2.p, r2.n) annotation (Line(points={{60,10},{60,50},{50,50},{50,60},{
          40,60}}, color={0,0,255}));
  connect(r1.p, r2.p) annotation (Line(points={{-20,10},{-20,50},{10,50},{10,60},
          {20,60}}, color={0,0,255}));
  connect(diode21.n, diode22.n)
    annotation (Line(points={{30,40},{30,40}}, color={0,0,255}));
  connect(r2.p, diode21.p)
    annotation (Line(points={{20,60},{10,60},{10,40}}, color={0,0,255}));
  connect(r2.n, diode22.p)
    annotation (Line(points={{40,60},{50,60},{50,40}}, color={0,0,255}));
  connect(opAmp.in_p, r2.p) annotation (Line(points={{-70,6},{-80,6},{-80,50},{
          10,50},{10,60},{20,60}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-6,
      Tolerance=1e-06),
    Diagram(graphics={
        Rectangle(
          extent={{-90,40},{-30,-60}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}), Text(
          extent={{-90,-50},{-30,-60}},
          textColor={28,108,200},
          textString="NIC"),
                      Text(
          extent={{-100,100},{0,70}},
          textColor={0,0,255},
          textString="R2 =   20 kOhm periodic
R2 = 8400 Ohm chaotic"),
                      Line(
          points={{20,54},{40,66}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end ImprovedCircuit;

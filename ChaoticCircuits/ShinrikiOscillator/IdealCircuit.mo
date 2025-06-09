within ChaoticCircuits.ShinrikiOscillator;
model IdealCircuit "Shinriki oscillator"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=320e-3 "Inductor";
  parameter SI.Resistance RL=100. "Resistor of L";
  parameter SI.Resistance R1=60e3 "Resistor 1";
  parameter SI.Resistance R2=20e3 "Resistor 2";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true)=c1.v "Result 1 c1.v";
  SI.Voltage v2(start=1, fixed=true)=c2.v "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=rL.v "Voltage of inductor's resistance";
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
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
  Components.ZenerDiodePairApproximation zDiodePair
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Components.IdealNIC idealNIC(redeclare
      ChaoticCircuits.ParameterSets.NIC.NIC_Shinriki nicData) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,0})));
equation
  connect(rL.p, inductor.n)
    annotation (Line(points={{80,-10},{80,10}}, color={0,0,255}));
  connect(ground.p, rL.n)
    annotation (Line(points={{-50,-40},{80,-40},{80,-30}}, color={0,0,255}));
  connect(c2.n, rL.n) annotation (Line(points={{60,-10},{60,-40},{80,-40},{80,-30}},
        color={0,0,255}));
  connect(c1.n, rL.n) annotation (Line(points={{0,-10},{0,-40},{80,-40},{80,-30}},
        color={0,0,255}));
  connect(r1.n, rL.n) annotation (Line(points={{-20,-10},{-20,-40},{80,-40},{80,
          -30}}, color={0,0,255}));
  connect(c2.p, inductor.p) annotation (Line(points={{60,10},{60,50},{80,50},{80,
          30}}, color={0,0,255}));
  connect(c1.p, r2.p) annotation (Line(points={{0,10},{0,50},{10,50},{10,60},{20,
          60}}, color={0,0,255}));
  connect(c2.p, r2.n) annotation (Line(points={{60,10},{60,50},{50,50},{50,60},{
          40,60}}, color={0,0,255}));
  connect(r1.p, r2.p) annotation (Line(points={{-20,10},{-20,50},{10,50},{10,60},
          {20,60}}, color={0,0,255}));
  connect(r2.p, zDiodePair.p) annotation (Line(points={{20,60},{10,60},{10,40},
          {20,40}}, color={0,0,255}));
  connect(r2.n, zDiodePair.n) annotation (Line(points={{40,60},{50,60},{50,40},
          {40,40}}, color={0,0,255}));
  connect(r1.p, idealNIC.p) annotation (Line(points={{-20,10},{-20,50},{-50,50},
          {-50,10}}, color={0,0,255}));
  connect(idealNIC.n, ground.p)
    annotation (Line(points={{-50,-10},{-50,-40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ShinrikiOscillator\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-6,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-100,100},{0,70}},
          textColor={0,0,255},
          textString="R2 =   20 kOhm periodic
R2 = 8400 Ohm chaotic"),
                      Line(
          points={{20,54},{40,66}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;

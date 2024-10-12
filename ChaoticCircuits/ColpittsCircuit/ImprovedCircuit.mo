within ChaoticCircuits.ColpittsCircuit;
model ImprovedCircuit "Colpitts chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Resistance R1=75. "Resistor 1";
  parameter SI.Resistance R2=500 "Resistor 2";
  parameter SI.Capacitance C1=54.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=54.e-9 "Capacitor 2";
  parameter SI.Inductance L=98.5e-6 "Inductor";
  parameter SI.Voltage Vs=5 "Source Voltage";
  //shortcut to results
  SI.Voltage v1=c1.v "Result c1.v";
  SI.Voltage v2=c2.v "Result 2 c2.v";
  //initialization
  parameter SI.Voltage v10=0 "Initial voltage of c1";
  parameter SI.Voltage v20=0 "Initial voltage of c2";
  parameter SI.Current iL0=0 "Initial current of L";
  Modelica.Electrical.Analog.Semiconductors.NPN npn
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(fixed=true, start=iL0),
                                                     L=L)
                                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,20})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-20})));
  Modelica.Electrical.Analog.Basic.Capacitor c1(v(fixed=true, start=v10),
                                                C=C1)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.Analog.Basic.Capacitor c2(v(fixed=true, start=v20),
                                                C=C2)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{30,-70},{50,-50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage bat1(V=Vs)
                                                          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage bat2(V=Vs)
                                                          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,-30})));
equation
  connect(inductor.n, npn.C)
    annotation (Line(points={{0,10},{0,6}}, color={0,0,255}));
  connect(npn.E, r2.p)
    annotation (Line(points={{0,-6},{0,-10}}, color={0,0,255}));
  connect(r1.n, inductor.p)
    annotation (Line(points={{0,40},{0,30}}, color={0,0,255}));
  connect(npn.C, c1.p)
    annotation (Line(points={{0,6},{20,6},{20,10},{40,10}}, color={0,0,255}));
  connect(npn.E, c1.n) annotation (Line(points={{0,-6},{20,-6},{20,-10},{40,-10}},
        color={0,0,255}));
  connect(c1.n, c2.p)
    annotation (Line(points={{40,-10},{40,-20}}, color={0,0,255}));
  connect(npn.B, ground.p)
    annotation (Line(points={{-20,0},{-30,0}}, color={0,0,255}));
  connect(c2.n, ground1.p)
    annotation (Line(points={{40,-40},{40,-50}}, color={0,0,255}));
  connect(ground.p, bat2.p)
    annotation (Line(points={{-30,0},{-40,0},{-40,-20}}, color={0,0,255}));
  connect(ground.p, bat1.n)
    annotation (Line(points={{-30,0},{-40,0},{-40,20}}, color={0,0,255}));
  connect(bat1.p, r1.p)
    annotation (Line(points={{-40,40},{-40,60},{0,60}}, color={0,0,255}));
  connect(bat2.n, r2.n) annotation (Line(points={{-40,-40},{-40,-60},{0,-60},{0,
          -30},{0,-30}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.01,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Line(
          points={{-10,44},{10,56}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end ImprovedCircuit;

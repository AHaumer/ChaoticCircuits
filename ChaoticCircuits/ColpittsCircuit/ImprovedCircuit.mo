within ChaoticCircuits.ColpittsCircuit;
model ImprovedCircuit "Colpitts chaotic Circuit"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Inductance L=98.5e-6 "Inductor";
  parameter SI.Resistance RL=35. "Resistor of L";
  parameter SI.Resistance RE=5000 "Emittor resistor";
  parameter SI.Capacitance C1=54.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=54.e-9 "Capacitor 2";
  //transistor parameters
  parameter Real beta=200 "Transistor forward current gain";
  parameter SI.Voltage Vth=0.75 "Transistor threshold voltage";
  parameter SI.Resistance Ron=100 "Small-signal on-resistance of base-emitter junction";
  parameter SI.Voltage Vs=5 "Source Voltage";
  //shortcut to results
  parameter SI.Frequency f0=1/(2*pi*sqrt(L*C1*C2/(C1+C2))) "Estimated resonance frequency";
  SI.Voltage v1(start=0, fixed=true)=c1.v "Result 1 c1.v";
  SI.Voltage v2(start=0, fixed=true)=c2.v "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=rL.v "Voltage of inductor's resistance";
  Modelica.Electrical.Analog.Semiconductors.NPN npn
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
                                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  Modelica.Electrical.Analog.Basic.Resistor rL(R=RL)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,60})));
  Modelica.Electrical.Analog.Basic.Resistor rE(R=RE) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-30})));
  Modelica.Electrical.Analog.Basic.Capacitor c1(C=C1)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Modelica.Electrical.Analog.Basic.Capacitor c2(C=C2)
                                                annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
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
    annotation (Line(points={{0,20},{0,6}}, color={0,0,255}));
  connect(npn.E,rE. p)
    annotation (Line(points={{0,-6},{0,-20}}, color={0,0,255}));
  connect(rL.n, inductor.p)
    annotation (Line(points={{0,50},{0,40}}, color={0,0,255}));
  connect(npn.C, c1.p)
    annotation (Line(points={{0,6},{0,10},{40,10}},         color={0,0,255}));
  connect(npn.E, c1.n) annotation (Line(points={{0,-6},{0,-10},{40,-10}},
        color={0,0,255}));
  connect(npn.B, ground.p)
    annotation (Line(points={{-20,0},{-30,0}}, color={0,0,255}));
  connect(ground.p, bat2.p)
    annotation (Line(points={{-30,0},{-40,0},{-40,-20}}, color={0,0,255}));
  connect(ground.p, bat1.n)
    annotation (Line(points={{-30,0},{-40,0},{-40,20}}, color={0,0,255}));
  connect(bat1.p,rL. p)
    annotation (Line(points={{-40,40},{-40,80},{0,80},{0,70}},
                                                        color={0,0,255}));
  connect(bat2.n,rE. n) annotation (Line(points={{-40,-40},{-40,-50},{0,-50},{0,
          -40}},         color={0,0,255}));
  connect(c2.n, c1.n)
    annotation (Line(points={{40,-20},{40,-10}}, color={0,0,255}));
  connect(ground1.p, c2.p)
    annotation (Line(points={{40,-50},{40,-40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.01,
      Interval=1e-07,
      Tolerance=1e-06),
    Diagram(graphics={Line(
          points={{-10,-36},{10,-24}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open}),
        Text(
          extent={{-18,6},{-12,0}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{-6,12},{0,6}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{-6,-6},{0,-12}},
          textColor={28,108,200},
          textString="E")}));
end ImprovedCircuit;

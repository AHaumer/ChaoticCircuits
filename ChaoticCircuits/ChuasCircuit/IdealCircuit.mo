within ChaoticCircuits.ChuasCircuit;
model IdealCircuit "Chua's chaotic Circuit"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=18e-3 "Inductor";
  parameter SI.Resistance RL=14 "Resistance of Inductor";
  parameter SI.Resistance R=1.9e3 "Resistor";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  //shortcut to results
  SI.Voltage vRL=resistorL.v "Result RL*L.i";
  SI.Voltage v1=capacitor1.v "Result c1.v";
  SI.Voltage v2=capacitor2.v "Result 2 c2.v";
  //initialization
  parameter SI.Voltage v10=0 "Initial voltage of c1";
  parameter SI.Voltage v20=1e-3 "Initial voltage of c2";
  parameter SI.Current iL0=0 "Initial current of L";
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(fixed=true, start=iL0),L=L)
    annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-20})));
  Modelica.Electrical.Analog.Basic.Resistor resistorL(R=RL)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,20})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(v(start=v10, fixed=true), C=C1)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(v(fixed=true, start=v20),C=C2)
    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  Modelica.Electrical.Analog.Examples.Utilities.NonlinearResistor chuasDiode(
    Ga=-757.0e-6,
    Gb=-408.7e-6,
    Ve=1.166) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,0})));
equation
  connect(resistor.p, capacitor2.p)
    annotation (Line(points={{-30,40},{-40,40},{-40,10}}, color={0,0,255}));
  connect(resistor.n, capacitor1.p)
    annotation (Line(points={{-10,40},{0,40},{0,10}},  color={0,0,255}));
  connect(ground.p, inductor.n)
    annotation (Line(points={{-20,-40},{-80,-40},{-80,-30}},
                                                           color={0,0,255}));
  connect(ground.p, capacitor2.n)
    annotation (Line(points={{-20,-40},{-40,-40},{-40,-10}},
                                                           color={0,0,255}));
  connect(ground.p, capacitor1.n)
    annotation (Line(points={{-20,-40},{0,-40},{0,-10}}, color={0,0,255}));
  connect(resistor.n, chuasDiode.p)
    annotation (Line(points={{-10,40},{50,40},{50,10}}, color={0,0,255}));
  connect(ground.p, chuasDiode.n)
    annotation (Line(points={{-20,-40},{50,-40},{50,-10}}, color={0,0,255}));
  connect(resistor.p, resistorL.p)
    annotation (Line(points={{-30,40},{-80,40},{-80,30}}, color={0,0,255}));
  connect(resistorL.n, inductor.p)
    annotation (Line(points={{-80,10},{-80,-10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Line(
          points={{-26,30},{-14,50}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;

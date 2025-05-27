within ChaoticCircuits.SimplestChaoticCircuit;
model PhysicalModelTheoretic "Simplest Chaotic Circuit with unrealistic parameters"
  extends Modelica.Icons.Example;
  parameter OscillatorData oscillatorData
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(fixed=true), L=oscillatorData.L)                            annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,0})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(start=0.1, fixed=true), C=oscillatorData.C)
    annotation (Placement(transformation(extent={{10,20},{-10,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Components.NegMemristor memristor(
    q(fixed=true),
    R0=oscillatorData.R0,
    I0=oscillatorData.I0)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,0})));
equation
  connect(ground.p, memristor.p)
    annotation (Line(points={{0,-30},{30,-30},{30,-10}}, color={0,0,255}));
  connect(capacitor.n, inductor.p)
    annotation (Line(points={{-10,30},{-30,30},{-30,10}}, color={0,0,255}));
  connect(inductor.n, ground.p)
    annotation (Line(points={{-30,-10},{-30,-30},{0,-30}}, color={0,0,255}));
  connect(capacitor.p, memristor.n)
    annotation (Line(points={{10,30},{30,30},{30,10}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.SimplestChaoticCircuit\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=1000,
      Interval=0.1,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-60,-60},{60,-100}},
          textColor={0,0,255},
          textString="R0 = 1.55 periodic
R0 = 1.50 chaotic  ",
          horizontalAlignment=TextAlignment.Left)}));
end PhysicalModelTheoretic;

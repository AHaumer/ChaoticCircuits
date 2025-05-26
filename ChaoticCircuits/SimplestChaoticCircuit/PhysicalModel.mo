within ChaoticCircuits.SimplestChaoticCircuit;
model PhysicalModel "Simplest Chaotic Circuit"
  extends Modelica.Icons.Example;
  extends Modelica.Icons.UnderConstruction;
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=3)
                                                     annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,0})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=1)
    annotation (Placement(transformation(extent={{10,20},{-10,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  Components.NegMemristor memristor annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,0})));
equation
  connect(ground.p, memristor.p)
    annotation (Line(points={{0,-30},{30,-30},{30,-10}}, color={0,0,255}));
  connect(memristor.n, capacitor.p)
    annotation (Line(points={{30,10},{30,30},{10,30}}, color={0,0,255}));
  connect(capacitor.n, inductor.p)
    annotation (Line(points={{-10,30},{-30,30},{-30,10}}, color={0,0,255}));
  connect(inductor.n, ground.p)
    annotation (Line(points={{-30,-10},{-30,-30},{0,-30}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.SimplestChaoticCircuit\">enclosing subpackage</a>.</p>
</html>"));
end PhysicalModel;

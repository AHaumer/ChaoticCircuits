within ChaoticCircuits.Test;
model TestTriode "Test the van der Pol triode"
  extends Modelica.Icons.Example;
  parameter SI.Current i0(start=-1, fixed=false) "Initial value of tube current";
  ChaoticCircuits.Components.Triode tube(R0=1, i(start=i0)) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
  Modelica.Electrical.Analog.Sources.CosineVoltage excitation(V=5, f=10)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
initial equation
  excitation.V=tube.R0*tube.I0*(i0/tube.I0 - (i0/tube.I0)^3);
equation
  connect(ground.p, tube.n)
    annotation (Line(points={{0,-20},{20,-20},{20,-10}}, color={0,0,255}));
  connect(excitation.p, tube.p) annotation (Line(points={{-20,10},{-20,20},{20,20},
          {20,10}}, color={0,0,255}));
  connect(ground.p, excitation.n)
    annotation (Line(points={{0,-20},{-20,-20},{-20,-10}}, color={0,0,255}));
end TestTriode;

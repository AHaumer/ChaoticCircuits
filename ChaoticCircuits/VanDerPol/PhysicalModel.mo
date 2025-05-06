within ChaoticCircuits.VanDerPol;
model PhysicalModel "van der Pol equations"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real mu=0.2 "Damping";
  parameter Real A=1.0 "Amplitude of excitation";
  parameter Real w=1.15 "Frequency of excitation";
  parameter Real x0=2 "Initial value of x";
  parameter Real y0=0 "Initial value of y";
  //assumptions
  parameter SI.Frequency f0=1000 "Natural frequency";
  parameter SI.Capacitance C=1e-6 "Capacitor";
  //calculated parameters
  parameter SI.Inductance L=1/((2*pi*f0)^2*C) "Inductor";
  parameter SI.Resistance R0=mu*sqrt(L/C) "Nonlinear resistor parameter";
  parameter SI.Current I0=0.2 "Nonlinear resistor parameter";
  parameter SI.Voltage V=A*I0/(w*2*pi*f0*C) "Excitation voltage amplitude";
  parameter SI.Current i0=x0*I0 "Initial value of current i";
  parameter SI.CurrentSlope didt0=2*pi*f0*I0*y0 "Initial value of current slope der(i)";
  //shortcut to results
  SI.Current i=triode.i "Current i";
  SI.CurrentSlope didt=der(i) "Current slope der(i)";
  Real x=i/i0 "Scaled current";
  Real y=didt/(2*pi*f0*I0) "Scaled current slope";
  Modelica.Electrical.Analog.Sources.SineVoltage excitation(
    V=V,
    phase=0,
    f=w*f0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
  ChaoticCircuits.Components.Triode triode(R0=R0, I0=I0)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
initial equation
  i=i0;
  didt=didt0;
equation
  connect(excitation.n, ground.p)
    annotation (Line(points={{-20,-10},{-20,-20}}, color={0,0,255}));
  connect(inductor.n, capacitor.p)
    annotation (Line(points={{10,20},{20,20},{20,10}}, color={0,0,255}));
  connect(inductor.p, excitation.p)
    annotation (Line(points={{-10,20},{-20,20},{-20,10}}, color={0,0,255}));
  connect(ground.p, triode.p)
    annotation (Line(points={{-20,-20},{-10,-20}}, color={0,0,255}));
  connect(triode.n, capacitor.n)
    annotation (Line(points={{10,-20},{20,-20},{20,-10}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      Interval=1e-05,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end PhysicalModel;

within ChaoticCircuits.ChaoticDiode;
model AnalyticEquations "Analytic equations of the chaotic diode circuit"
  extends Modelica.Icons.Example;
  parameter Real a=1/5200 "Parameter a = Ra*Ids/nVt";
  parameter Real b=1.5 "Parameter b = R/Rb";
  parameter Modelica.Units.SI.Time Tau=0.1e-3 "Time constant";
  parameter Real x0[3]={0, 0.1, 0} "Initial value of solution";
  Real x[3] "Solution x, y, z";
initial equation
  x=x0;
equation
  Tau*der(x[1])=-x[2];
  Tau*der(x[2])=-x[3];
  Tau*der(x[3])=-x[1] + a*(exp(x[2]) - 1) - b*x[3];
  annotation (                                 experiment(
      StopTime=0.1,
      Interval=1e-6,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"));
end AnalyticEquations;

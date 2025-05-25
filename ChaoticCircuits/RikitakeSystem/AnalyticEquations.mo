within ChaoticCircuits.RikitakeSystem;
model AnalyticEquations "Rikitake system"
  extends Modelica.Icons.Example;
  parameter Real mu=0.4 "Resistive parameter";
  parameter Real D =2 "Speed difference";
  parameter SI.Time tRef=0.030 "Reference for sclaing time";
  //shortcut to results
  Real x1(start=0.001, fixed=true) "Current 1";
  Real x2(start=0.001, fixed=true) "Current 2";
  Real z(start=1, fixed=true) "Speed";
equation
  tRef*der(x1)= -mu*x1 + x2* z;
  tRef*der(x2)= -mu*x2 + x1*(z - D);
  tRef*der(z) = 1 - x1*x2;
  annotation (experiment(
      StopTime=15,
      Interval=0.0005,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.RikitakeSystem\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,-80},{80,-100}},
          textColor={0,0,255},
          textString="Path to chaos: mu={0.4, 0.6, 0.8}")}));
end AnalyticEquations;

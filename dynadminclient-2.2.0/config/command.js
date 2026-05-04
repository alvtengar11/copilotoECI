function(line) {
  var proc = karate.fork({ redirectErrorStream: false, useShell: true, line: line, workingDir: '../..', environment: karate.env });
  proc.waitSync();
  karate.set('sysOut', proc.sysOut);
  karate.set('sysErr', proc.sysErr);
  karate.set('exitCode', proc.exitCode);
}
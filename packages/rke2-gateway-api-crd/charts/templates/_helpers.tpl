{{/*
Render CRDs file.
*/}}
{{- define "render-crds" -}}
    {{- $scope := .scope -}}
    {{- range $path, $bytes := $scope.Files.Glob .path }}
        {{- range $doc := regexSplit "\n---\n" ($scope.Files.Get $path) -1 }}
            {{- $crd :=  $doc | fromYaml -}}
---
# source: {{ $path }}
{{ $crd | toYaml }}
            {{- end }}
        {{- end }}
{{- end -}}

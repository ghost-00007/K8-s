{{- define "voting-app.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "voting-app.labels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
{{- end -}}
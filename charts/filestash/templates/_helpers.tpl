{{/*
Expand the name of the chart.
*/}}
{{- define "filestash.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "filestash.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for the document server.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "filestash.documentServer.fullname" -}}
{{- if .Values.documentServer.fullnameOverride }}
{{- .Values.documentServer.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" ( include "filestash.fullname" . ) .Values.documentServer.nameOverride }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "filestash.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "filestash.labels" -}}
helm.sh/chart: {{ include "filestash.chart" . }}
{{ include "filestash.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "filestash.selectorLabels" -}}
app.kubernetes.io/name: {{ include "filestash.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common component labels
*/}}
{{- define "filestash.componentLabels.webapp" -}}
app.kubernetes.io/component: webapp
{{- end }}

{{- define "filestash.componentLabels.documentServer" -}}
app.kubernetes.io/component: document-server
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "filestash.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "filestash.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

icon: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...  # Base64 encoded image data


Pipe example 
values.yaml 
my:
  custom:
    data: " test"
	


deployment.yaml
	{{- .Values.my.custom.data | default "test123146" | upper }} 

example 2 

customblock:
  author:
    name: "Pramoth"
    address: "Bangalore"
    email:
	
  {{.Values.customblock.author.name | default "Suresh" | upper | nindent 1 }}
  {{.Values.customblock.author.address | default "Chennai" | upper | quote |nindent 1 }}
  {{.Values.customblock.author.email | default "pramoth@gmail.com" | quote | nindent 1  }}

if example 

values.yaml 
my:
  flag:
    enabled: false
	
deployment.yaml

{{- if .Values.my.flag.enabled }}
{{"flag is true"| nindent 4}}
{{- else }}
{{ "flag is false"|nindent 4 }}
{{- end}}


{{- if not .Values.my.flag.enabled }}
{{"flag is true"| nindent 4}}
{{- else }}
{{ "flag is false"| nindent 4 }}
{{- end}}

with 

{{- with.Values.customblock.author.name}}
{{"author:"}}
{{- toYaml .| nindent 4}}
{{ - else }} 
{{ "value is empty" | nindent 4 }} 
{{- end}}

customblock:
  author:
    name: 
    - "Pramoth"
    - "Sivakanthan"
    - "Siv"
    - "Sivak"
    - "Siva" 
    - "Sivakant" 

variable defination 

{{ $myvar := false }}
message: |
  {{- if $myvar }}
  I'm true
  {{- else }}
  I'm false
  {{- end }}
  
  {{- range .Values.customblock.author.name }}
  
  customblock:
  author:
    name: 
    - "Pramoth"
    - "Sivakanthan"
    - "Siv"
    - "Sivak"
    - "Siva" 
    - "Sivakant"
  
 Dictonary 
 
{{- range $key, $value := .Values.image }}
{{$key}}: {{$value}}
{{- end }}


Chart dependeinces 

in chart.yan

dependencies:
	- name: mysql
	  version: "12.0.01"
      repository: "chart url" 
dependencies:
  - name: mysql
    version: "12.2.2"
    repository: "https://charts.bitnami.com/bitnami"
	  
helm dependency update 



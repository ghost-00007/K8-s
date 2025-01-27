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




pipeline {
    agent any

    stages {
        // Stage 1: Package the Helm chart
        stage("Package Helm Chart") {
            steps {
                sh """
                helm package voting-app
                """
            }
        }

        // Stage 2: Publish the Helm chart to JFrog Artifactory
        stage("Publish Helm Chart to JFrog") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'jfrog-creds', usernameVariable: 'JFROG_USERNAME', passwordVariable: 'JFROG_PASSWORD')]) {
                    sh """
                    # Set up Helm registry credentials
                    export HELM_EXPERIMENTAL_OCI=1
                    echo ${JFROG_PASSWORD} | helm registry login -u ${JFROG_USERNAME} --password-stdin <artifactory-url>

                    # Push the Helm chart to JFrog
                    CHART_VERSION=$(helm show chart voting-app | grep '^version:' | awk '{print $2}')
                    helm push voting-app-${CHART_VERSION}.tgz oci://<artifactory-url>/<helm-repo>
                    """
                }
            }
        }


sed -i 's|^\( *image: \)postgres:15-alpine|\1new-db-image:new-tag|g' values.yaml
sed -i 's|^\( *image: \)redis:alpine|\1new-redis-image:new-tag|g' values.yaml
sed -i 's|^\( *image: \)dockersamples/examplevotingapp_vote|\1new-vote-image:new-tag|g' values.yaml
sed -i 's|^\( *image: \)dockersamples/examplevotingapp_result|\1new-result-image:new-tag|g' values.yaml
sed -i 's|^\( *image: \)dockersamples/examplevotingapp_worker|\1new-worker-image:new-tag|g' values.yaml

$ python3 -m http.server --bind 127.0.0.1

helm repo index 

helm repo add <repo folder> 

helm repo update:

github pages

oci repository 

https://docs.docker.com/docker-hub/repos/manage/hub-images/oci-artifacts/

local repo 

index.yaml 
and helm.gz 

Push to github 


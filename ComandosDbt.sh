
git checkout -b develop

python -m venv venv

source venv/Scripts/activate

pip install -r requirements.txt

dbt init

dbt debug

source .env
echo $DBT_DBNAME

git status
git add --all
git commit -m 'inclusao de seeds'


git push --set-upstream origin develop


# apos criar o arquivo country_codes.csv na pasta seed
dbt seed

#Projeto um
echo "# dbt_udemy_projeto_1" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:charlesfsouza/dbt_udemy_projeto_1.git


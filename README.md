# detective

***********

## env file structure

Add .env/[target_name].env file

```
supabaseAnonKey=
supabaseUrl=
sentryDsn=
```

## Auto-generation

- generate **freezed** files
- generate **json** files
- generate **colors** file

```sh
fvm dart run build_runner build --delete-conflicting-outputs
```
***********

***********
## Generate loclization keys file

```sh
fvm dart run easy_localization:generate -S ./assets/translations --output-dir ./lib/presentation/shared/localization --output-file locale_keys.g.dart -f keys
```


import 'package:gotrue/gotrue.dart';

const String SPLASH_SCREEN = 'SPLASH_SCREEN';
const String SIGNIN_SCREEN = 'SIGNIN_SCREEN';
const String SIGNUP_SCREEN = 'SIGNUP_SCREEN';
const String PASSWORDRECOVER_SCREEN = 'PASSWORDRECOVER_SCREEN';

const PERSIST_SESSION_KEY = 'PERSIST_SESSION_KEY';

const SUPABASE_URL = '';
const SUPABASE_ANNON_KEY = '';
final gotrueClient = GoTrueClient(url: '$SUPABASE_URL/auth/v1', headers: {
  'Authorization': 'Bearer $SUPABASE_ANNON_KEY',
  'apikey': SUPABASE_ANNON_KEY,
});

import 'package:gotrue_client/gotrue_client.dart';

const String SPLASH_SCREEN = 'SPLASH_SCREEN';
const String SIGNIN_SCREEN = 'SIGNIN_SCREEN';
const String SIGNUP_SCREEN = 'SIGNUP_SCREEN';
const String PASSWORDRECOVER_SCREEN = 'PASSWORDRECOVER_SCREEN';

const PERSIST_SESSION_KEY = 'PERSIST_SESSION_KEY';

final gotrueClient = GoTrueClient(
    url: 'https://nmbtadhxevkgnywohlie.supabase.net/auth/v1',
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxMTcxNjE0MiwiZXhwIjoxOTI3MjkyMTQyfQ.utotClF3wl5mRf4Hl9gC_HP3edyLX-3rs4RCnKrRuKQ',
      'apikey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxMTcxNjE0MiwiZXhwIjoxOTI3MjkyMTQyfQ.utotClF3wl5mRf4Hl9gC_HP3edyLX-3rs4RCnKrRuKQ',
    });

import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

const supabase = createClient<Database>('url', 'key');


//
// 'posts' - Does not work
//

// DOES NOT WORK, 'users' is possibly null, clearly there is a required FK
const test1 = await supabase.from('posts').select('users(*)')

// DOES NOT WORK, 'user_id' is empty array
const test2 = await supabase.from('posts').select('user_id(*)');

// DOES NOT WORK, 'user' is empty array
const test3 = await supabase.from('posts').select('user:user_id(*)');

// DOES NOT WORK, 'users' is array instead of single
const test4 = await supabase.from('posts').select('users!user_id(*)');

// DOES NOT WORK, 'user' is array instead of single
const test5 = await supabase.from('posts').select('user:users!user_id(*)');

//
// 'posts' - Works
//

// Works, 'users' is single
const test6 = await supabase.from('posts').select('users!inner(*)');

// Works, 'user' is single
const test7 = await supabase.from('posts').select('user:users!inner(*)');








import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

const supabase = createClient<Database>('url', 'key');



// works as expected (array)
const test1 = await supabase.from('posts').select('*, comments(*)');

// works as expected (array)
const test2 = await supabase.from('users').select('*, posts(*)');


// DOES NOT WORK, is empty array
const test5 = await supabase.from('posts').select('*, user:user_id(*)')

// DOES NOT WORK, is possibly null
const test6 = await supabase.from('posts').select('*, user:users(*)');

// DOES NOT WORK, is array instead of single
const test7 = await supabase.from('posts').select('*, user:users!user_id(*)');




import { createClient } from '@supabase/supabase-js';
import type { Database } from './database.types';

const supabase = createClient<Database>('url', 'key');

// works as expected (possible array)
const test1 = await supabase.from('posts').select('*, comments(*)');

// works as expected (possible array)
const test2 = await supabase.from('users').select('*, posts(*)');

// works as expected (one, possibly null)
const test3 = await supabase.from('comments').select('*, posts(*)');

// works as expected (one, possibly null)
const test4 = await supabase.from('comments').select('*, users(*)');


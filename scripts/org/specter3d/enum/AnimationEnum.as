package org.specter3d.enum
{
   import org.specter3d.context.AppGlobalContext;
   
   public class AnimationEnum
   {
      
      public static const IDLE:String = "std1";
      
      public static const ASTD1:String = "astd1";
      
      public static const RANDOM_IDLE:String = "std2";
      
      public static const RUN:String = "run";
      
      public static const ARUN:String = "arun";
      
      public static const JUMP1:String = "jump1";
      
      public static const JUMP2:String = "jump2";
      
      public static const HURT:String = "hurt";
      
      public static const RELIVE:String = "relive";
      
      public static const DIE:String = "die";
      
      public static const SWIM1:String = "swim1";
      
      public static const SWIM2:String = "swim2";
      
      public static const THINK:String = "think";
      
      public static const WALK:String = "walk";
      
      public static const RIDE_WALK:String = "ride_walk";
      
      public static const RIDE_STD1:String = "ride_std1";
      
      public static const RIDE_STD2:String = "ride_std2";
      
      public static const SHOW1:String = "show1";
      
      public static const SHOW2:String = "show2";
      
      public static const ATTACK_5_2:String = "skill4_2";
      
      public static const ATTACK_3_2:String = "skill3_2";
      
      public static const ATTACK_9_2:String = "skill9_2";
      
      public static const SKILL1_2:String = "skill1_2";
      
      public static const HITFLY:String = "hitfly";
      
      public static const FLY:String = "fly";
      
      public static const FEILONG:String = "feilong";
      
      public static const NO_UPDATE_NAME_ACTION:Array = ["jump1","jump2","skill10","die","relive"];
      
      public static const BATTLE_ACT_LIST:Array = ["hurt","die","skill1","skill2","skill3","skill3_1","skill3_2","skill4","skill5","skill4_2","skill6","skill9_2","hitfly"];
       
      
      public function AnimationEnum()
      {
         super();
      }
      
      public static function getAutoTransition(param1:String, param2:String) : Boolean
      {
         if(!param1 || !param2 || !AppGlobalContext.autoTransition)
         {
            return false;
         }
         if(param1.indexOf("ride") == -1 && param2.indexOf("ride") == 0)
         {
            return false;
         }
         if(param1.indexOf("ride") == 0 && param2.indexOf("ride") == -1)
         {
            return false;
         }
         if(param1.indexOf("hurt") == 0 || param2.indexOf("hurt") == 0)
         {
            return false;
         }
         if(param1.indexOf("skill") == 0 || param2.indexOf("skill") == 0)
         {
            return false;
         }
         if(param1.indexOf("go") == 0 || param2.indexOf("back") == 0)
         {
            return false;
         }
         return true;
      }
      
      public static function getLoop(param1:String) : Boolean
      {
         var _loc2_:* = param1;
         if("std1" !== _loc2_)
         {
            if("std2" !== _loc2_)
            {
               if("astd1" !== _loc2_)
               {
                  if("run" !== _loc2_)
                  {
                     if("arun" !== _loc2_)
                     {
                        if("walk" !== _loc2_)
                        {
                           if("ride_walk" !== _loc2_)
                           {
                              if("ride_std1" !== _loc2_)
                              {
                                 if("ride_std2" !== _loc2_)
                                 {
                                    if("skill4_2" !== _loc2_)
                                    {
                                       if("skill3_2" !== _loc2_)
                                       {
                                          if("skill9_2" !== _loc2_)
                                          {
                                             if("skill1_2" !== _loc2_)
                                             {
                                                if("swim1" !== _loc2_)
                                                {
                                                   if("swim2" !== _loc2_)
                                                   {
                                                      if("think" !== _loc2_)
                                                      {
                                                         if("std_1" !== _loc2_)
                                                         {
                                                            if("std_2" !== _loc2_)
                                                            {
                                                               if("std_3" !== _loc2_)
                                                               {
                                                                  if("hurt_2_1" !== _loc2_)
                                                                  {
                                                                     if("skill_2_2" !== _loc2_)
                                                                     {
                                                                        if("hurt_2_2" !== _loc2_)
                                                                        {
                                                                           if("weak" !== _loc2_)
                                                                           {
                                                                              if("ride_1" !== _loc2_)
                                                                              {
                                                                                 if("ride_2" !== _loc2_)
                                                                                 {
                                                                                    if("run_3" !== _loc2_)
                                                                                    {
                                                                                       if("ride" !== _loc2_)
                                                                                       {
                                                                                          if("go" !== _loc2_)
                                                                                          {
                                                                                             if("back" !== _loc2_)
                                                                                             {
                                                                                                return false;
                                                                                             }
                                                                                          }
                                                                                          addr33:
                                                                                          return true;
                                                                                       }
                                                                                       addr32:
                                                                                       §§goto(addr33);
                                                                                    }
                                                                                    addr31:
                                                                                    §§goto(addr32);
                                                                                 }
                                                                                 addr30:
                                                                                 §§goto(addr31);
                                                                              }
                                                                              addr29:
                                                                              §§goto(addr30);
                                                                           }
                                                                           addr28:
                                                                           §§goto(addr29);
                                                                        }
                                                                        addr27:
                                                                        §§goto(addr28);
                                                                     }
                                                                     addr26:
                                                                     §§goto(addr27);
                                                                  }
                                                                  addr25:
                                                                  §§goto(addr26);
                                                               }
                                                               addr24:
                                                               §§goto(addr25);
                                                            }
                                                            addr23:
                                                            §§goto(addr24);
                                                         }
                                                         addr22:
                                                         §§goto(addr23);
                                                      }
                                                      addr21:
                                                      §§goto(addr22);
                                                   }
                                                   addr20:
                                                   §§goto(addr21);
                                                }
                                                addr19:
                                                §§goto(addr20);
                                             }
                                             addr18:
                                             §§goto(addr19);
                                          }
                                          addr17:
                                          §§goto(addr18);
                                       }
                                       addr16:
                                       §§goto(addr17);
                                    }
                                    addr15:
                                    §§goto(addr16);
                                 }
                                 addr14:
                                 §§goto(addr15);
                              }
                              addr13:
                              §§goto(addr14);
                           }
                           addr12:
                           §§goto(addr13);
                        }
                        addr11:
                        §§goto(addr12);
                     }
                     addr10:
                     §§goto(addr11);
                  }
                  addr9:
                  §§goto(addr10);
               }
               addr8:
               §§goto(addr9);
            }
            addr7:
            §§goto(addr8);
         }
         §§goto(addr7);
      }
   }
}

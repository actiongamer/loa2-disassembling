package nslm2.modules.fightPlayer
{
   import com.mz.core.interFace.ILogger;
   import com.mz.core.logging.Log;
   
   public class FPDebug
   {
      
      private static var logger:ILogger = Log.getClassLogger(FPDebug);
       
      
      public function FPDebug()
      {
         super();
      }
      
      public function log(param1:int, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param2.id;
         if(0 !== _loc4_)
         {
            if(1 !== _loc4_)
            {
               if(2 !== _loc4_)
               {
                  if(3 !== _loc4_)
                  {
                     if(4 !== _loc4_)
                     {
                        if(5 !== _loc4_)
                        {
                           if(6 !== _loc4_)
                           {
                              if(7 !== _loc4_)
                              {
                                 if(9 !== _loc4_)
                                 {
                                    if(11 !== _loc4_)
                                    {
                                       if(12 !== _loc4_)
                                       {
                                          if(13 !== _loc4_)
                                          {
                                             if(14 !== _loc4_)
                                             {
                                                if(15 !== _loc4_)
                                                {
                                                   if(17 !== _loc4_)
                                                   {
                                                      if(18 !== _loc4_)
                                                      {
                                                         if(22 !== _loc4_)
                                                         {
                                                            if(23 !== _loc4_)
                                                            {
                                                               if(24 !== _loc4_)
                                                               {
                                                                  if(25 !== _loc4_)
                                                                  {
                                                                     if(26 === _loc4_)
                                                                     {
                                                                        _loc3_ = "玩家:" + param2.data0 + "buff删除" + param2.data1;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     _loc3_ = "玩家:" + param2.data0 + "buff更新Id" + param2.data1 + "回合数:" + param2.data2 + "叠加数" + param2.data3;
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc3_ = "玩家:" + param2.data0 + "受到" + param2.data1 + "治疗";
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc3_ = "玩家:" + param2.data0 + "闪避";
                                                            }
                                                         }
                                                         else
                                                         {
                                                            _loc3_ = "玩家:" + param2.data0 + "格挡";
                                                         }
                                                      }
                                                      else
                                                      {
                                                         _loc3_ = "玩家:" + param2.data0 + "怒气更新:" + param2.data1;
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc3_ = "===========第" + param2.data0 + "回合开始";
                                                   }
                                                }
                                                else
                                                {
                                                   _loc3_ = "技能效果表现,效果ID" + param2.data0;
                                                }
                                             }
                                             else
                                             {
                                                _loc3_ = "子弹从玩家:" + param2.data0 + "飞向" + param2.data1;
                                             }
                                          }
                                          else
                                          {
                                             _loc3_ = "玩家:" + param2.data0 + "技能后摇";
                                          }
                                       }
                                       else
                                       {
                                          _loc3_ = "玩家:" + param2.data0 + "多段打击(" + param2.data1 + ")";
                                       }
                                    }
                                    else
                                    {
                                       _loc3_ = "玩家:" + param2.data0 + "技能前摇,技能ID" + param2.data1;
                                    }
                                 }
                                 else
                                 {
                                    _loc3_ = "玩家:" + param2.data0 + "普攻后摇结束";
                                 }
                              }
                              else
                              {
                                 _loc3_ = "战斗结束,结果:" + param2.data0;
                              }
                           }
                           else
                           {
                              _loc3_ = "玩家" + param2.data0 + "死亡";
                           }
                        }
                        else
                        {
                           _loc3_ = "玩家" + param2.data0 + "归位";
                        }
                     }
                     else
                     {
                        _loc3_ = "玩家" + param2.data0 + "受到" + param2.data1 + "伤害";
                     }
                  }
                  else
                  {
                     _loc3_ = "玩家" + param2.data0 + "普攻后摇";
                  }
               }
               else
               {
                  _loc3_ = "玩家" + param2.data0 + "普攻前摇";
               }
            }
            else
            {
               _loc3_ = "玩家" + param2.data0 + "移动到x:" + param2.data1 + "y:" + param2.data2;
            }
         }
         else
         {
            _loc3_ = "玩家" + param2.data0 + "进入待机";
         }
         logger.debug("帧" + param1 + ":",_loc3_);
      }
   }
}

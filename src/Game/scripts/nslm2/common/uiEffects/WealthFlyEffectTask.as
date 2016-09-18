package nslm2.common.uiEffects
{
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.managers.timerMgrs.TimerManager;
   import com.game.shared.motion.viewMotion.MotionGravityView;
   import com.game.plot.script.Scripts;
   import com.mz.core.interFace.IDelayRefresh;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.game.shared.motion.core.MotionScript;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.foundations.mainToolBar.MainBottomIconModule;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.game.shared.motion.CoinMotionObject;
   import flash.display.DisplayObject;
   import com.game.plot.script.ScriptEvent;
   import com.game.shared.EffectConst;
   import nslm2.common.model.PlayerModel;
   
   public class WealthFlyEffectTask extends TaskBase
   {
       
      
      public var kind:int;
      
      public var num:int;
      
      public var from;
      
      private var toTarget;
      
      private var delayExec:int;
      
      public function WealthFlyEffectTask(param1:int, param2:int, param3:*)
      {
         super();
         this.kind = param1;
         this.num = param2;
         this.from = param3;
      }
      
      public function setToPoi(param1:*) : WealthFlyEffectTask
      {
         this.toTarget = param1;
         return this;
      }
      
      public function set_delayExec(param1:int) : WealthFlyEffectTask
      {
         this.delayExec = param1;
         return this;
      }
      
      override public function exec() : void
      {
         if(delayExec > 0)
         {
            TimerManager.ins.doOnce(delayExec,_exec);
         }
         else
         {
            _exec();
         }
      }
      
      private function _exec() : void
      {
         super.exec();
         var _loc2_:* = kind;
         if(10 !== _loc2_)
         {
            if(1 !== _loc2_)
            {
               if(3 !== _loc2_)
               {
                  if(4 !== _loc2_)
                  {
                     if(2 !== _loc2_)
                     {
                        if(12 !== _loc2_)
                        {
                           if(17 !== _loc2_)
                           {
                              if(19 !== _loc2_)
                              {
                                 if(4444 !== _loc2_)
                                 {
                                    if(15 !== _loc2_)
                                    {
                                       if(7 !== _loc2_)
                                       {
                                          if(5 !== _loc2_)
                                          {
                                             if(20 !== _loc2_)
                                             {
                                                if(30 !== _loc2_)
                                                {
                                                   var $effId:int = 1000105;
                                                   num = getdefaultEffNum(num);
                                                }
                                                else
                                                {
                                                   $effId = 1000105;
                                                   num = getGoldEffNum(num);
                                                   if(toTarget)
                                                   {
                                                      var $target:* = toTarget;
                                                   }
                                                   else
                                                   {
                                                      $target = (GlobalRef.bottomModuleBtns as MainBottomIconModule).heroIcon;
                                                   }
                                                }
                                             }
                                             else
                                             {
                                                $effId = 1000105;
                                                num = getGoldEffNum(num);
                                                if(toTarget)
                                                {
                                                   $target = toTarget;
                                                }
                                                else
                                                {
                                                   $target = (GlobalRef.bottomModuleBtns as MainBottomIconModule).flyToIcon;
                                                }
                                             }
                                          }
                                          else
                                          {
                                             $effId = 1000105;
                                             num = getGoldEffNum(num);
                                             if(toTarget)
                                             {
                                                $target = toTarget;
                                             }
                                             else
                                             {
                                                $target = GlobalRef.bottom_icon_arena_coin;
                                             }
                                          }
                                       }
                                       else
                                       {
                                          $effId = 1000105;
                                          num = getGoldEffNum(num);
                                          if(toTarget)
                                          {
                                             $target = toTarget;
                                          }
                                          else
                                          {
                                             $target = GlobalRef.bottom_icon_guaji_coin;
                                          }
                                       }
                                    }
                                    else
                                    {
                                       $effId = 1000105;
                                       num = getGoldEffNum(num);
                                       if(toTarget)
                                       {
                                          $target = toTarget;
                                       }
                                       else
                                       {
                                          $target = (GlobalRef.bottomModuleBtns as MainBottomIconModule).flyToIcon;
                                       }
                                    }
                                 }
                                 else
                                 {
                                    $effId = 1000108;
                                 }
                              }
                              else
                              {
                                 $effId = 1000105;
                                 num = getGoldEffNum(num);
                                 if(toTarget)
                                 {
                                    $target = toTarget;
                                 }
                                 else
                                 {
                                    $target = GlobalRef.bottom_icon_tpkcCoin;
                                 }
                              }
                           }
                           else
                           {
                              $effId = 1000105;
                              num = getGoldEffNum(num);
                              if(toTarget)
                              {
                                 $target = toTarget;
                              }
                              else
                              {
                                 $target = GlobalRef.bottom_icon_pkcrossCoin;
                              }
                           }
                        }
                        else
                        {
                           $effId = 1000103;
                           num = getGoldEffNum(num);
                           if(toTarget)
                           {
                              $target = toTarget;
                           }
                           else
                           {
                              $target = GlobalRef.bottom_icon_shenYuanCoin;
                           }
                        }
                     }
                     else
                     {
                        $effId = 1000105;
                        if(toTarget)
                        {
                           $target = toTarget;
                        }
                        else
                        {
                           $target = GlobalRef.playerHeader_icon_stamina;
                        }
                        num = getdStaminaNum(num);
                     }
                  }
                  else
                  {
                     $effId = 1000101;
                     num = getGoldEffNum(num);
                     if(toTarget)
                     {
                        $target = toTarget;
                     }
                     else
                     {
                        $target = GlobalRef.playerHeader_icon_diamond;
                     }
                  }
               }
               else
               {
                  $effId = 1000101;
                  num = getGoldEffNum(num);
                  if(toTarget)
                  {
                     $target = toTarget;
                  }
                  else
                  {
                     $target = GlobalRef.playerHeader_icon_diamond;
                  }
               }
            }
            else
            {
               $effId = 1000102;
               num = getGoldEffNum(num);
               if(toTarget)
               {
                  $target = toTarget;
               }
               else
               {
                  $target = GlobalRef.playerHeader_icon_gold;
               }
            }
         }
         else
         {
            $effId = 10150014;
            num = getExpEffNum(num);
            if(toTarget)
            {
               $target = toTarget;
            }
            else
            {
               $target = GlobalRef.bottomModuleBtns.expBar;
            }
         }
         if(kind == 5386)
         {
            num = Math.min(25,Math.ceil(num / 2));
         }
         var scripts:Scripts = new Scripts(null,null,null,0.00001);
         if(this.toTarget)
         {
            $target = this.toTarget;
         }
         if($target is IDelayRefresh)
         {
            var refreshLockObj:IDelayRefresh = $target as IDelayRefresh;
         }
         var $from:Point = ModuleMgr.ins.toGlobalPoi(this.from);
         var i:uint = 0;
         while(i < num)
         {
            var startAng:Number = Math.random() * 3.14159265358979 * 2 - 3.14159265358979;
            if($target)
            {
               var speed:uint = 400 + Math.random() * 300;
               var gravity:uint = 1000;
               var f:uint = 1000;
               var $bmc:BmcSpriteSheet = new BmcSpriteSheet();
               $bmc.init($effId,1,"all",true,1,0);
               var icon:MotionGravityView = new CoinMotionObject($bmc,$target,ModuleMgr.ins.topEffectLayer,startAng,speed,gravity,f);
               if($target is FlyTarget)
               {
                  var $toDis:Object = ($target as FlyTarget).target;
               }
               else if($target is IDelayRefresh)
               {
                  $toDis = ($target as IDelayRefresh).targetObject;
               }
               else if($target is DisplayObject)
               {
                  $toDis = $target;
               }
               icon.setCallBack(ArriveTickEff.createIns($toDis).start,null);
            }
            if(icon)
            {
               icon.setLoca($from.x,$from.y);
               var motionScript:MotionScript = new MotionScript(icon);
               if(i == 0)
               {
                  if(refreshLockObj)
                  {
                     var flyAnim:Boolean = true;
                     motionScript.addEventListener("script_over",function():*
                     {
                        var /*UnknownSlot*/:* = function(param1:ScriptEvent):void
                        {
                           motionScript.removeEventListener("script_over",firstAnimFinish);
                           if(refreshLockObj)
                           {
                              refreshLockObj.refreshData();
                           }
                        };
                        return function(param1:ScriptEvent):void
                        {
                           motionScript.removeEventListener("script_over",firstAnimFinish);
                           if(refreshLockObj)
                           {
                              refreshLockObj.refreshData();
                           }
                        };
                     }());
                  }
               }
               motionScript.addEventListener("script_over",function():*
               {
                  var /*UnknownSlot*/:* = function(param1:ScriptEvent):void
                  {
                     motionScript.removeEventListener("script_over",playSound);
                  };
                  return function(param1:ScriptEvent):void
                  {
                     motionScript.removeEventListener("script_over",playSound);
                  };
               }());
               scripts.pushScript(motionScript);
            }
            i = Number(i) + 1;
         }
         scripts.addEventListener("script_over",scriptOver);
         scripts.play();
         EffectConst.playShineEff(this.from);
      }
      
      private function scriptOver(param1:ScriptEvent) : void
      {
         var _loc2_:Scripts = param1.target as Scripts;
         _loc2_.removeEventListener("script_over",scriptOver);
         _loc2_.dispose();
         PlayerModel.ins.changeWealth(kind,PlayerModel.ins.getWealthValue(kind));
         this.onComplete();
      }
      
      private function getGoldEffNum(param1:uint) : uint
      {
         if(param1 >= 3)
         {
            if(param1 <= 9)
            {
               return 3;
            }
            if(param1 <= 999)
            {
               return 5;
            }
            if(param1 <= 9999)
            {
               return 10;
            }
            if(param1 <= 99999)
            {
               return 20;
            }
            return 30;
         }
         return param1;
      }
      
      private function getExpEffNum(param1:*) : int
      {
         if(param1 >= 3)
         {
            if(param1 <= 9)
            {
               return 3;
            }
            if(param1 <= 999)
            {
               return 5;
            }
            if(param1 <= 9999)
            {
               return 10;
            }
            if(param1 <= 99999)
            {
               return 20;
            }
            return 30;
         }
         return param1;
      }
      
      private function getdStaminaNum(param1:*) : int
      {
         if(param1 < 3)
         {
            return param1;
         }
         if(param1 <= 9)
         {
            return 3;
         }
         if(param1 <= 100)
         {
            return 5;
         }
         if(param1 <= 999)
         {
            return 10;
         }
         return 3;
      }
      
      private function getdefaultEffNum(param1:*) : int
      {
         if(param1 >= 3)
         {
            if(param1 <= 9)
            {
               return 3;
            }
            if(param1 <= 999)
            {
               return 5;
            }
            if(param1 <= 9999)
            {
               return 10;
            }
            if(param1 <= 99999)
            {
               return 20;
            }
            return 30;
         }
         return param1;
      }
   }
}

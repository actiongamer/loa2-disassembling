package nslm2.modules.dungeons.scripts.cmds
{
   import com.mz.core.interFace.IDispose;
   import com.mz.core.logging.Log;
   import nslm2.modules.dungeons.scripts.ScriptCmdVo;
   import nslm2.modules.dungeons.scripts.IScriptBox;
   import com.mz.core.utils2.task.TaskBase;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.utils.RTools;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.types.DirConsts;
   import flash.geom.Point;
   import nslm2.modules.fightPlayer.UnitVo;
   import nslm2.modules.fightPlayer.PosConts;
   
   public class ScriptCmdBase implements IDispose
   {
       
      
      public var vo:ScriptCmdVo;
      
      public var module:IScriptBox;
      
      protected var startTimer:int;
      
      protected var runFrame:int;
      
      private var _totalFrame:int;
      
      public var _isEnd:Boolean = false;
      
      public var endHandler:Function;
      
      public function ScriptCmdBase()
      {
         vo = new ScriptCmdVo();
         super();
      }
      
      public static function parse(param1:Object) : ScriptCmdBase
      {
         var _loc2_:* = null;
         var _loc3_:* = param1["cmd"];
         if("filmSubtitle" !== _loc3_)
         {
            if("tweenTo" !== _loc3_)
            {
               if("branch" !== _loc3_)
               {
                  if("enterUnit" !== _loc3_)
                  {
                     if("effect2d" !== _loc3_)
                     {
                        if("effect3d" !== _loc3_)
                        {
                           if("image" !== _loc3_)
                           {
                              if("delImage" !== _loc3_)
                              {
                                 if("delEffect2d" !== _loc3_)
                                 {
                                    if("action" !== _loc3_)
                                    {
                                       if("faceSide" !== _loc3_)
                                       {
                                          if("camera" !== _loc3_)
                                          {
                                             if("createNpc" !== _loc3_)
                                             {
                                                if("deleteNpc" !== _loc3_)
                                                {
                                                   if("showNpc" !== _loc3_)
                                                   {
                                                      if("hideNpc" !== _loc3_)
                                                      {
                                                         if("say1" !== _loc3_)
                                                         {
                                                            if("say2" !== _loc3_)
                                                            {
                                                               if("moveTo" !== _loc3_)
                                                               {
                                                                  if("shake" !== _loc3_)
                                                                  {
                                                                     if("delay" !== _loc3_)
                                                                     {
                                                                        if("end" !== _loc3_)
                                                                        {
                                                                           if("changeBGM" !== _loc3_)
                                                                           {
                                                                              if("newEnemyCome" !== _loc3_)
                                                                              {
                                                                                 Log.error(ScriptCmdBase,"unknown type:",param1["type"]);
                                                                                 _loc2_ = new ScriptCmd_Unknown();
                                                                              }
                                                                              else
                                                                              {
                                                                                 _loc2_ = new ScriptCmd_newEnemyCome();
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              _loc2_ = new ScriptCmd_ChangeBGM();
                                                                           }
                                                                        }
                                                                        else
                                                                        {
                                                                           _loc2_ = new ScriptCmd_End();
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        _loc2_ = new ScriptCmd_Delay();
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     _loc2_ = new ScriptCmd_Shake();
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc2_ = new ScriptCmd_MoveTo();
                                                               }
                                                            }
                                                         }
                                                         _loc2_ = new ScriptCmd_Say2();
                                                      }
                                                      else
                                                      {
                                                         _loc2_ = new ScriptCmd_HideNpc();
                                                      }
                                                   }
                                                   else
                                                   {
                                                      _loc2_ = new ScriptCmd_ShowNpc();
                                                   }
                                                }
                                                else
                                                {
                                                   _loc2_ = new ScriptCmd_DeleteUnit();
                                                }
                                             }
                                             else
                                             {
                                                _loc2_ = new ScriptCmd_CreateUnit();
                                             }
                                          }
                                          else
                                          {
                                             _loc2_ = new ScriptCmd_Camera();
                                          }
                                       }
                                       else
                                       {
                                          _loc2_ = new ScriptCmd_FaceSide();
                                       }
                                    }
                                    else
                                    {
                                       _loc2_ = new ScriptCmd_Action();
                                    }
                                 }
                              }
                              _loc2_ = new ScriptCmd_DelEffect2d();
                           }
                           else
                           {
                              _loc2_ = new ScriptCmd_Image();
                           }
                        }
                        else
                        {
                           _loc2_ = new ScriptCmd_Effect3d();
                        }
                     }
                     else
                     {
                        _loc2_ = new ScriptCmd_Effect2d();
                     }
                  }
                  else
                  {
                     _loc2_ = new ScriptCmd_EnterTeam();
                  }
               }
               else
               {
                  _loc2_ = new ScriptCmd_Branch();
               }
            }
            else
            {
               _loc2_ = new ScriptCmd_TweenTo();
            }
         }
         else
         {
            _loc2_ = new ScriptCmd_FilmSubtitle();
         }
         _loc2_.parse(param1);
         return _loc2_;
      }
      
      public function parse(param1:Object) : void
      {
         this.vo.parse(param1);
      }
      
      public function getResTaskArr() : Vector.<TaskBase>
      {
         return new Vector.<TaskBase>();
      }
      
      public function onStart(param1:TimerHandlerVo) : void
      {
         startTimer = TimerManager.ins.currTimer;
      }
      
      public function onStep(param1:TimerHandlerVo) : void
      {
         runFrame = Number(runFrame) + 1;
      }
      
      public function set totalFrame(param1:int) : void
      {
         _totalFrame = param1;
      }
      
      public function get totalFrame() : int
      {
         if(_totalFrame == 0)
         {
            if(this.vo.time == 0)
            {
               return 0;
            }
            return RTools.msToFrame(this.vo.time);
         }
         return _totalFrame;
      }
      
      protected function checkEndTimer() : void
      {
         if(TimerManager.ins.currTimer - this.startTimer >= this.vo.time)
         {
            this.onEnd();
         }
      }
      
      protected function checkEnd() : void
      {
         if(this.runFrame >= this.totalFrame)
         {
            this.onEnd();
         }
      }
      
      public function onEnd() : void
      {
         _isEnd = true;
         if(endHandler != null)
         {
            this.endHandler();
            this.endHandler = null;
         }
      }
      
      protected function findEleArr(param1:Boolean = true) : Array
      {
         if(vo.id == null || vo.id == "")
         {
            if(param1)
            {
               Log.fatal(this,"id不应为是null或空字符串");
            }
            return [];
         }
         var _loc2_:Array = this.module.getUnitById(vo.id);
         if(_loc2_.length == 0 && param1)
         {
            Log.fatal(this,"没有找到unit id:",vo.id);
         }
         return _loc2_;
      }
      
      protected function findUnit(param1:String, param2:Boolean = true) : UnitView
      {
         var _loc3_:UnitView = this.module.getUnitById(param1).pop();
         if(_loc3_ == null && param2)
         {
            Log.fatal(this,"没有找到unit id:",this.vo.id);
         }
         return _loc3_;
      }
      
      public function countRotation() : int
      {
         if(vo.faceSide > 0)
         {
            return DirConsts.countRo(this.vo.faceSide);
         }
         return this.vo.rotation;
      }
      
      protected function parseAimXY(param1:UnitVo, param2:int, param3:int) : Point
      {
         var _loc4_:* = null;
         if(param2 || int(param3))
         {
            _loc4_ = new Point(param2,param3);
            return _loc4_;
         }
         if(this.vo.side > 0)
         {
            _loc4_ = PosConts.oriXY(this.vo.pos,this.vo.side == 1);
            return new Point(_loc4_.x + module.anchorPoi.x,_loc4_.y + module.anchorPoi.y);
         }
         if(this.vo.pos > 0)
         {
            _loc4_ = PosConts.oriXY(this.vo.pos,param1.side == 1);
            return new Point(_loc4_.x + module.anchorPoi.x,_loc4_.y + module.anchorPoi.y);
         }
         _loc4_ = PosConts.oriXY(param1.posId,param1.side == 1);
         return new Point(_loc4_.x + module.anchorPoi.x,_loc4_.y + module.anchorPoi.y);
      }
      
      public function dispose() : void
      {
         onEnd();
      }
   }
}

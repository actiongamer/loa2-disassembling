package nslm2.modules.footstones.alerts
{
   import morn.customs.components.TopModuleView;
   import proto.EventNotify;
   import nslm2.modules.funnies.teamPKCS.TPKCModel;
   import nslm2.utils.ProtoUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.nets.sockets.ServerEngine;
   import morn.core.handlers.Handler;
   import morn.core.utils.URLUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSysNoticeVo;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import nslm2.modules.funnies.arenas.ArenaService;
   import com.mz.core.configs.ClientConfig;
   
   public class EventNoticeModule extends TopModuleView
   {
       
      
      public function EventNoticeModule()
      {
         super();
         this.mouseEvent = false;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc5_:Vector.<EventNotify> = EventNoticeService.ins.cache;
         var _loc2_:int = _loc5_.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = _loc5_[_loc4_];
            eventHandler(_loc3_);
            _loc4_++;
         }
         TPKCModel.ins.tryStartTimer();
         EventNoticeService.ins.cache = null;
         EventNoticeService.ins.handler = this.eventHandler;
         super.preShow(param1);
      }
      
      private function eventHandler(param1:EventNotify) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc8_:int = 0;
         var _loc6_:* = null;
         var _loc2_:Array = ProtoUtils.parseParaArr(param1.param);
         var _loc9_:* = param1.kind;
         if(11 !== _loc9_)
         {
            if(12 !== _loc9_)
            {
               if(545 !== _loc9_)
               {
                  if(546 !== _loc9_)
                  {
                     if(543 !== _loc9_)
                     {
                        if(576 !== _loc9_)
                        {
                           if(1000 === _loc9_)
                           {
                              _loc2_[1] = WealthUtil.getItemColorName(_loc2_[1]);
                           }
                        }
                        else
                        {
                           _loc2_[1] = WealthUtil.getNpcGroupName(_loc2_[1]);
                        }
                     }
                     else
                     {
                        _loc2_[1] = WealthUtil.getNpcGroupName(_loc2_[1]);
                     }
                  }
                  addr164:
                  var _loc7_:StcSysNoticeVo = StcMgr.ins.getSysNoticeVo(param1.kind);
                  if(_loc7_ == null)
                  {
                     return;
                     §§push(new StcLackFatal(this,"static_sys_notice",param1.kind));
                  }
                  else
                  {
                     if(!(int(param1.kind) - 531))
                     {
                        ArenaService.ins.beChangeRank(_loc2_[1]);
                     }
                     _loc8_ = 0;
                     while(_loc8_ < _loc2_.length)
                     {
                        if(checkisjson(String(_loc2_[_loc8_])))
                        {
                           _loc6_ = JSON.parse(_loc2_[_loc8_]);
                           if(ClientConfig.language == "common")
                           {
                              _loc2_[_loc8_] = _loc6_["cn"];
                           }
                           else
                           {
                              _loc2_[_loc8_] = _loc6_[ClientConfig.language];
                           }
                        }
                        _loc8_++;
                     }
                     var _loc4_:String = LocaleMgr.ins.getStr(_loc7_.text,_loc2_);
                     FloatUtil.sendEventNotice(_loc7_.showArr,_loc4_);
                     return;
                  }
               }
               _loc5_ = StcMgr.ins.getNpcGroupVo(_loc2_[1]);
               if(_loc5_)
               {
                  _loc2_[1] = LocaleMgr.ins.getStr(_loc5_.name);
               }
               §§goto(addr164);
            }
            else
            {
               ServerEngine.ins.disConn = true;
               _loc3_ = _loc2_[0];
               ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000107) + "\n" + LinkUtils.fanChenMi(_loc3_),new Handler(URLUtils.openWindow,[_loc3_,"_self"]),null,null,0,null,1,1,false));
               return;
            }
         }
         else
         {
            _loc3_ = _loc2_[1];
            ObserverMgr.ins.sendNotice("alertTop",new AlertMsgVo(LocaleMgr.ins.getStr(999000106,[TimeUtils.getOffLineTime(_loc2_[0])]) + "\n" + LinkUtils.fanChenMi(_loc3_)));
            return;
         }
      }
      
      private function checkisjson(param1:String) : Boolean
      {
         if(param1.indexOf("{") == 0 && param1.indexOf("}") == param1.length - 1)
         {
            if(param1.indexOf("\"cn\"") != 0 && param1.indexOf("\"en\"") != 0 && param1.indexOf("\"tw\"") != 0 && param1.indexOf("\"fr\"") != 0 && param1.indexOf("\"de\"") != 0)
            {
               return true;
            }
         }
         return false;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_GM_CMD"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_GM_CMD" !== _loc3_)
         {
         }
      }
   }
}

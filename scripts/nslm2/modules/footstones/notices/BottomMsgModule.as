package nslm2.modules.footstones.notices
{
   import game.ui.notices.BottomMsgModuleUI;
   import nslm2.modules.foundations.friendModules.FriendService;
   import nslm2.modules.foundations.noticeModule.vo.NoticeVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.utils.Uint64Util;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.foundations.noticeModule.model.NoticeModel;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.friendModules.activities.FriendGiftParam;
   import nslm2.modules.foundations.AlertUtil;
   
   public class BottomMsgModule extends BottomMsgModuleUI
   {
       
      
      public function BottomMsgModule()
      {
         super();
         this.centerX = 0;
         this.bottom = 160;
         this.listMsg.array = [];
         this.listMsg.addEventListener("triggered",listRender_triggered);
      }
      
      public function get service() : BottomMsgService
      {
         return BottomMsgService.ins;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         FriendService.ins.sendInitBottomMsg();
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("msg_new_bottom_msg");
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         var _loc8_:* = null;
         var _loc4_:int = 0;
         var _loc7_:* = null;
         super.handleNotices(param1,param2);
         var _loc9_:* = param1;
         if("msg_new_bottom_msg" === _loc9_)
         {
            _loc6_ = param2 as BottomMsgVo;
            _loc5_ = BottomMsgConsts.ins.getConfigVo(_loc6_.kind);
            _loc6_.configVo = _loc5_;
            _loc3_ = true;
            _loc8_ = new NoticeVo();
            _loc8_.timeStamp = ServerTimer.ins.second;
            switch(int(_loc6_.kind) - 2)
            {
               case 0:
                  _loc8_.content = LocaleMgr.ins.getStr(999000126) + TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000127),LinkUtils.evtString(531,10700),458496);
                  _loc3_ = false;
                  break;
               default:
                  _loc8_.content = LocaleMgr.ins.getStr(999000126) + TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000127),LinkUtils.evtString(531,10700),458496);
                  _loc3_ = false;
                  break;
               default:
                  _loc8_.content = LocaleMgr.ins.getStr(999000126) + TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000127),LinkUtils.evtString(531,10700),458496);
                  _loc3_ = false;
                  break;
               case 3:
                  _loc8_.content = "有人跟你发起私聊      " + TextFieldUtil.linkHtmlText2("查看",LinkUtils.evtString(531,10540,Uint64Util.toString(_loc6_.data as UInt64)),458496);
                  break;
               default:
                  _loc8_.content = "有人跟你发起私聊      " + TextFieldUtil.linkHtmlText2("查看",LinkUtils.evtString(531,10540,Uint64Util.toString(_loc6_.data as UInt64)),458496);
                  break;
               case 5:
                  _loc3_ = false;
                  _loc8_.content = LocaleMgr.ins.getStr(999000128) + TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(999000129),LinkUtils.evtString(531,10631),458496);
            }
            if(!_loc3_)
            {
               NoticeModel.ins.pushNotify(_loc8_);
               return;
            }
            if(_loc5_.repeat)
            {
               _loc4_ = ArrayUtil.indexByAttr(this.listMsg.array,"kind",_loc6_.kind);
               _loc7_ = this.listMsg.array[_loc4_];
               if(_loc7_)
               {
                  if(_loc6_.data is uint && _loc6_.data as uint == 0)
                  {
                     _loc7_.dataArr = [];
                     ArrayUtil.removeItemAt(this.listMsg.array,_loc4_);
                  }
                  else
                  {
                     _loc7_.dataArr.push(_loc6_.data);
                     this.listMsg.refreshItem(_loc4_);
                  }
                  this.listMsg.refresh();
               }
               else
               {
                  if(!(_loc6_.data is uint && _loc6_.data as uint == 0))
                  {
                     this.listMsg.array.push(_loc6_);
                  }
                  this.listMsg.refresh();
               }
            }
            else
            {
               this.listMsg.array.push(_loc6_);
               this.listMsg.refresh();
            }
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.preCloseCpl();
      }
      
      private function listRender_triggered(param1:MzEvent) : void
      {
         var _loc2_:BottomMsgVo = param1.data;
         ArrayUtil.removeItem(this.listMsg.array,_loc2_);
         this.listMsg.refresh();
         switch(int(_loc2_.kind) - 2)
         {
            case 0:
               AlertUtil.floadNoOpenModule();
               break;
            default:
               AlertUtil.floadNoOpenModule();
               break;
            default:
               AlertUtil.floadNoOpenModule();
               break;
            case 3:
               ModuleMgr.ins.showModule(10540,_loc2_.data,ModuleMgr.ins.popLayer.curModuleId);
               break;
            default:
               ModuleMgr.ins.showModule(10540,_loc2_.data,ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 5:
               AlertUtil.floadNoOpenModule();
               break;
            default:
               AlertUtil.floadNoOpenModule();
               break;
            default:
               AlertUtil.floadNoOpenModule();
               break;
            case 8:
               ModuleMgr.ins.showModule(10603);
               break;
            case 9:
               ModuleMgr.ins.showModule(10621,new FriendGiftParam(2));
               break;
            case 10:
               ModuleMgr.ins.showModule(50502,null,ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 11:
               ModuleMgr.ins.showModule(42004,null,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
   }
}

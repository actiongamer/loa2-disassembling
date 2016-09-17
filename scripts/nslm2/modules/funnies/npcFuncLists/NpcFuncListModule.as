package nslm2.modules.funnies.npcFuncLists
{
   import game.ui.npcFuncLists.NpcFuncListModuleUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.ServerTimer;
   import com.mz.core.utils.MathUtil;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.utils.TextFieldUtil;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class NpcFuncListModule extends NpcFuncListModuleUI
   {
       
      
      private var textCDCtrl:TextCDCtrlS2;
      
      private var npcRelationVo:StcStageNpcRelationVo;
      
      public function NpcFuncListModule()
      {
         super();
         this.moduleFadeInType = 25;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc10_:int = 0;
         var _loc9_:int = 0;
         var _loc6_:* = null;
         this.txt_activeName.visible = false;
         this.txt_activeCd.visible = false;
         this.txt_help.visible = false;
         var _loc3_:NpcFuncListParam = param1 as NpcFuncListParam;
         npcRelationVo = StcMgr.ins.getStageNpcRelationVo(_loc3_.npcRelationId);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(npcRelationVo.name);
         this.panelBg.bgCustom.addChild(this.img_bg);
         this.playIcon.img_icon.url = UrlLib.headRoundIcon(npcRelationVo.left_head.toString());
         this.playIcon.img_icon.smoothing = true;
         this.txt_activeName.text = LocaleMgr.ins.getStr(9100000 + 41500);
         textCDCtrl = new TextCDCtrlS2(this.txt_activeCd,textCDFormat,txtCDCtrl_cpl);
         this.parts.push(new TextCDCtrlS2(this.txt_activeCd,textCDFormat,txtCDCtrl_cpl));
         textCDCtrl.start(ServerTimer.ins.second + 10000);
         var _loc7_:Array = npcRelationVo.dialog.split("|");
         this.txt_prompt1.text = LocaleMgr.ins.getStr(_loc7_[MathUtil.randomInt(_loc7_.length - 1,0)]);
         var _loc4_:Array = [];
         var _loc8_:Array = npcRelationVo.subFuncIdArr;
         var _loc5_:int = _loc8_.length;
         _loc10_ = 0;
         while(_loc10_ < _loc5_)
         {
            _loc9_ = _loc8_[_loc10_];
            _loc6_ = NpcFuncService.ins.getVo(_loc9_);
            if(StcMgr.ins.getFunctionVo(_loc9_).canOpen)
            {
               _loc4_.push(_loc6_);
            }
            _loc10_++;
         }
         if(_loc4_.length <= 4)
         {
            this.list.y = 126;
            this.list.repeatY = 4;
            this.list.spaceY = 6;
         }
         this.list.array = _loc4_;
         this.list.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
         this.txt_help.text = LocaleMgr.ins.getStr(999000442) + TextFieldUtil.htmlText2("5:00",458496) + LocaleMgr.ins.getStr(999000443);
         var _loc2_:int = UIMgr.gameWidth / 2 - this.width - 80;
         if(_loc2_ < 10)
         {
            _loc2_ = 10;
         }
         this.x = _loc2_;
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_NPC_FUNC_VO_CHANGE"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         super.handleNotices(param1,param2);
         var _loc8_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc8_)
         {
            _loc5_ = -1;
            _loc6_ = this.list.cells.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = this.list.getCell(_loc7_) as NpcFuncListRender;
               if(_loc3_.vo && _loc3_.vo.funcId == int(param2))
               {
                  _loc5_ = _loc7_;
                  break;
               }
               _loc7_++;
            }
            if(_loc5_ > -1)
            {
               _loc4_ = NpcFuncService.ins.getVo(int(param2));
               if(_loc4_)
               {
                  (this.list.getCell(_loc5_) as NpcFuncListRender).changeVo(_loc4_);
               }
            }
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000444) + TimeUtils.hisColonAddZero2(param1),LabelUtils.cdColor(true));
      }
      
      private function txtCDCtrl_cpl() : void
      {
         this.txt_activeCd.text = TextFieldUtil.htmlText2("--:--",LabelUtils.cdColor(true));
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ObserverMgr.ins.sendNotice("NPC_FUNC_CLOSE");
         super.preClose(param1);
      }
   }
}

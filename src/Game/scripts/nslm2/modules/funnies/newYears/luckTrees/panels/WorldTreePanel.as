package nslm2.modules.funnies.newYears.luckTrees.panels
{
   import game.ui.newYears.luckTrees.panels.WorldTreePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import proto.StaticLuckTreeWorldRewardModel;
   import morn.core.utils.StringUtils;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.RTools;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   
   public class WorldTreePanel extends WorldTreePanelUI implements IViewStackPage
   {
       
      
      public var shineStartX:int;
      
      public var shineEndX:int;
      
      private var sparkEff:BmcSpriteSheet;
      
      public function WorldTreePanel()
      {
         super();
         shineStartX = this.img_progressShine.x;
         shineEndX = this.img_progressShine.x + 312;
         sparkEff = new BmcSpriteSheet();
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.setAnchor(0.5,0.5);
         _loc2_.init(60000003,1,"all",true);
         DisplayUtils.addChildAbove(_loc2_,this.img_progressShine);
         sparkEff.y = this.img_progressShine.y + 62;
         this.img_progressShine.visible = false;
         this.txt_tree_lv_label.text = LocaleMgr.ins.getStr(13350012);
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(11);
         this.txt_cd.text = LocaleMgr.ins.getStr(50600046) + TimeUtils.getFullTimeStrCN(_loc1_.startTm,false,false,RTools.cl(false,true),false) + " - " + TimeUtils.getFullTimeStrCN(_loc1_.endTm,false,false,RTools.cl(false,true),false);
         this.list_gift.vScrollBarSkin = "png.a5.comps.scrollBar.vscroll_S3";
         txt_to_world_tree.addEventListener("click",txt_to_person_tree_click);
         txt_to_world_tree.text = TextFieldUtil.linkHtmlText2(LocaleMgr.ins.getStr(13350013),LinkUtils.evtString(0),16046112);
         this.txt_list_title_lv.text = LocaleMgr.ins.getStr(13350014);
         this.txt_list_title_reward.text = LocaleMgr.ins.getStr(13350015);
         this.txt_list_title_option.text = LocaleMgr.ins.getStr(13350016);
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.TEXT_GROW_SELECTED_FILTER_PURPLE).addHandler(breath_cb));
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.img_tree_bg.filters = param1;
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function viewStackIn() : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         this.visible = true;
         var _loc1_:Array = [];
         var _loc2_:int = this.service.worldRewardArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.service.worldRewardArr[_loc4_];
            if(StringUtils.isNull(_loc3_.item) == false)
            {
               _loc1_.push(_loc3_);
            }
            _loc4_++;
         }
         this.list_gift.array = _loc1_;
         this.refreshUI();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      private function refreshUI() : void
      {
         var _loc1_:Number = NaN;
         if(this.service.infoRes.currentlevel >= this.service.getWorldTreeLevelMax())
         {
            this.progressBar.value = 1;
            this.img_progressShine.x = this.shineStartX + (this.shineEndX - this.shineStartX);
            this.txt_val.text = "";
         }
         else
         {
            _loc1_ = this.service.infoRes.currentexp / this.service.getWorldRewardByLv(this.service.infoRes.currentlevel).exp;
            this.progressBar.value = _loc1_;
            this.img_progressShine.x = this.shineStartX + (this.shineEndX - this.shineStartX) * _loc1_;
            this.txt_val.text = this.service.infoRes.currentexp + "/" + this.service.getWorldRewardByLv(this.service.infoRes.currentlevel).exp;
         }
         sparkEff.x = this.img_progressShine.x + 37;
         this.txt_tree_lv.text = "Lv." + this.service.infoRes.currentlevel;
      }
      
      private function txt_to_person_tree_click(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("MSG_TAB_TO_PERSON_TREE");
      }
   }
}

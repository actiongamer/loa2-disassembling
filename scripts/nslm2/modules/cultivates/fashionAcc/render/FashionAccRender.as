package nslm2.modules.cultivates.fashionAcc.render
{
   import game.ui.fashionAcc.FashionAccRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.bag.itemModuels.BagModel;
   import com.mz.core.utils.FilterUtil;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class FashionAccRender extends FashionAccRenderUI
   {
       
      
      private var _stcVo:StcFashionSynVo;
      
      public function FashionAccRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(param1 as StcFashionSynVo)
         {
            _stcVo = param1 as StcFashionSynVo;
            _loc3_ = StcMgr.ins.getItemVo((param1 as StcFashionSynVo).item);
            _loc2_ = StcMgr.ins.getFashionExtraSkillVo((param1 as StcFashionSynVo).skill);
            _loc4_ = StcMgr.ins.getSkillVo(_loc2_.skillId);
            this.txt_desc.text = LocaleMgr.ins.getStr(999900523,[LocaleMgr.ins.getStr(_loc4_.name)]);
            if(BagModel.ins.getStcCount(_loc3_.id) > 0)
            {
               this.txt_has.text = "";
               this.box_content.filters = null;
            }
            else
            {
               this.txt_has.text = "";
               this.box_content.filters = [FilterUtil.grayFilter()];
            }
            .super.dataSource = WealthUtil.createItemVo((param1 as StcFashionSynVo).item);
            ObserverMgr.ins.regObserver(this);
            checkRedPoint();
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = param1;
         if("acc_make_cpl" !== _loc5_)
         {
            if("MSG_SWITCH_MODULE_REN_POINT" === _loc5_)
            {
               _loc3_ = param2 as SwitchModuleRedPointMsg;
               if(_loc3_.moduleId == 31200)
               {
                  checkRedPoint();
               }
            }
         }
         else
         {
            _loc4_ = StcMgr.ins.getItemVo(_stcVo.item);
            if(BagModel.ins.getStcCount(_loc4_.id) > 0)
            {
               this.box_content.filters = null;
            }
            else
            {
               this.box_content.filters = [FilterUtil.grayFilter()];
            }
            checkRedPoint();
         }
         super.handleNotices(param1,param2);
         ObserverMgr.ins.regObserver(this);
      }
      
      private function checkRedPoint() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(this._stcVo)
         {
            _loc2_ = StcMgr.ins.getItemVo(_stcVo.item);
            if(FashionModel.ins.isSynItemEnough(_stcVo) == false)
            {
               Effect2DUtils.hideBtnEff_btnBig(this);
            }
            else
            {
               _loc1_ = Effect2DUtils.showBtnEff_btnBig(this).setScaleXY(1.55,1.5);
               _loc1_.x = 0;
               _loc1_.y = -14;
               _loc1_.mouseEvent = false;
            }
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["acc_make_cpl","MSG_SWITCH_MODULE_REN_POINT"]);
      }
   }
}

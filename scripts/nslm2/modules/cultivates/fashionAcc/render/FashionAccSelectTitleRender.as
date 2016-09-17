package nslm2.modules.cultivates.fashionAcc.render
{
   import game.ui.fashionAcc.FashionAccSelectTitleRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.FilterLib;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mediators.RollMediator;
   
   public class FashionAccSelectTitleRender extends FashionAccSelectTitleRenderUI implements IObserver
   {
       
      
      private var filterMed:RoleGrowFilterMed;
      
      private var _isRoll:Boolean;
      
      public function FashionAccSelectTitleRender()
      {
         super();
         this.img_iconSelected.filters = [FilterLib.ins.getRollGrowByColor(16542720)];
         filterMed = new RoleGrowFilterMed(this.img_icon,null);
         this.parts.push(new RoleGrowFilterMed(this.img_icon,null));
         this.parts.push(new RollMediator(this.img_icon,onRoll));
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(this.dataSource)
         {
            _isRoll = param1;
            this.filters = null;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         .super.dataSource = param1;
         var _loc2_:StcFashionSynVo = StcMgr.ins.getVoByColumnValue("static_fashion_syn","itemType",param1);
         if(_loc2_)
         {
            _loc3_ = StcMgr.ins.getItemVo(_loc2_.item);
            if(ClientConfig.isChineseLang() == false)
            {
               this.txt_name2.size = 15;
            }
            this.txt_name.text = LocaleMgr.ins.getStr(_loc2_.typeName);
            this.txt_name2.text = LocaleMgr.ins.getStr(_loc2_.typeName) + "(" + LocaleMgr.ins.getStr(8000 + _loc3_.kind) + ")";
            filterMed.glowFilter = FilterLib.ins.getRollGrowByColor(16542720);
            ObserverMgr.ins.regObserver(this);
            checkRedPoint();
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
      }
      
      private function checkRedPoint() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc5_:Array = StcMgr.ins.getVoArrByColumnValue("static_fashion_syn","itemType",dataSource);
         var _loc3_:Boolean = false;
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc4_] as StcFashionSynVo;
            if(FashionModel.ins.isSynItemEnough(_loc2_))
            {
               _loc3_ = true;
               break;
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            _loc1_ = Effect2DUtils.showBtnEff_btnBig(this).setScaleXY(1.6,1.65);
            _loc1_.x = -12;
            _loc1_.y = -16;
            _loc1_.mouseEvent = false;
         }
         else
         {
            Effect2DUtils.hideBtnEff_btnBig(this);
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("acc_make_cpl" === _loc3_)
         {
            checkRedPoint();
         }
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["acc_make_cpl"];
      }
   }
}

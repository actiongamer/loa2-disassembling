package nslm2.modules.foundations.recycle.view.panel.heroRec
{
   import game.ui.recycleModules.heroRecycle.HeroRecyclePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.geom.Point;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.modules.foundations.recycle.view.render.RecycleItemRender;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import morn.core.handlers.Handler;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.recycle.service.RecycleService;
   import proto.RecycleHeroDecomposeRes;
   import nslm2.utils.WealthUtil;
   
   public class HeroRecylePanel extends HeroRecyclePanelUI implements IViewStackPage, IObserver
   {
       
      
      private var recModel:RecycleModel;
      
      private var recEff:BmcSpriteSheet;
      
      private var bgEff:BmcSpriteSheet;
      
      public function HeroRecylePanel()
      {
         var _loc1_:* = null;
         super();
         recModel = RecycleModel.ins;
         _loc1_ = list_heros.getCell(3) as RecycleItemRender;
         var _loc2_:* = 0.6;
         _loc1_.img_plus.scaleY = _loc2_;
         _loc1_.img_plus.scaleX = _loc2_;
         _loc1_ = list_heros.getCell(4) as RecycleItemRender;
         _loc2_ = 0.6;
         _loc1_.img_plus.scaleY = _loc2_;
         _loc1_.img_plus.scaleX = _loc2_;
         _loc1_ = list_heros.getCell(1) as RecycleItemRender;
         _loc2_ = 0.5;
         _loc1_.img_plus.scaleY = _loc2_;
         _loc1_.img_plus.scaleX = _loc2_;
         _loc1_ = list_heros.getCell(2) as RecycleItemRender;
         _loc2_ = 0.5;
         _loc1_.img_plus.scaleY = _loc2_;
         _loc1_.img_plus.scaleX = _loc2_;
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.list_heros.dataSource = [null,null,null,null,null];
         this.visible = true;
         bgEff = new BmcSpriteSheet();
         bgEff.x = 233;
         bgEff.y = 113;
         bgEff.init(1130003,1,"all",true);
         addChildAt(bgEff,1);
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
         recModel.resetSelectedHero();
         bgEff.dispose();
         bgEff = null;
      }
      
      public function getFocusNotices() : Array
      {
         return ["recycle_notice_update_list","recycle_notice_confirm"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("recycle_notice_update_list" !== _loc3_)
         {
            if("recycle_notice_confirm" === _loc3_)
            {
               doRecycleEffect();
               list_heros.mouseEvent = false;
            }
         }
         else
         {
            list_heros.dataSource = recModel.selectedHeroList;
         }
      }
      
      private function doRecycleEffect() : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc6_:int = 0;
         var _loc5_:int = 5;
         var _loc2_:Point = this.localToGlobal(new Point(364,172));
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = list_heros.getItem(_loc6_) as RecycleVo;
            if(_loc4_)
            {
               _loc3_ = list_heros.getCell(_loc6_) as RecycleItemRender;
               if(_loc3_)
               {
                  _loc3_.box_content.visible = false;
                  _loc1_ = new ImgMoveEffect();
                  _loc1_.config(0.5,0.8);
                  _loc1_.init(_loc3_.img_icon,_loc3_.img_icon.localToGlobal(new Point()),_loc2_,new Handler(moveIconEndHandler));
                  _loc1_.startAnim();
               }
            }
            _loc6_++;
         }
      }
      
      private function moveIconEndHandler() : void
      {
         if(!recEff)
         {
            recEff = new BmcSpriteSheet();
            recEff.x = 280;
            recEff.y = -30;
            recEff.init(1130002,1,"all",false,1,0,new Handler(endHandler));
            addChild(recEff);
            TweenLite.delayedCall(0.6,requestService);
         }
      }
      
      private function endHandler() : void
      {
         recEff = null;
      }
      
      private function requestService() : void
      {
         RecycleService.ins.recycleHeroDecompose(recModel.selectedHeroIdList,true,1,heroDecomposeHandler,null);
         list_heros.mouseEvent = true;
      }
      
      private function heroDecomposeHandler(param1:RecycleHeroDecomposeRes) : void
      {
         var _loc2_:Array = [];
         if(param1)
         {
            _loc2_ = WealthUtil.rewardArrToWealthVoArr(param1.res);
         }
         this.list_heros.dataSource = [null,null,null,null,null];
         ObserverMgr.ins.sendNotice("recycle_notice_show_reward",_loc2_);
         list_heros.mouseEnabled = true;
      }
   }
}

package nslm2.modules.funnies.newYears.luckTrees.panels
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.funnies.newYears.luckTrees.services.LuckTreeService;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import game.ui.newYears.luckTrees.panels.PersonTreePanelUI;
   import morn.customs.components.WealthRender;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.uiEffects.IconShakeAndDropAndFlyEff;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import com.mz.core.utils.ArrayUtil;
   
   public class PersonTreeBagMediator extends EventDispatcher implements IDispose
   {
      
      public static const EVT_FLY_CPL_ALL:String = "EVT_FLY_CPL_ALL";
       
      
      public var view:PersonTreePanelUI;
      
      private var iconFlayEffArr:Array;
      
      public function PersonTreeBagMediator(param1:PersonTreePanelUI)
      {
         var _loc2_:int = 0;
         iconFlayEffArr = [];
         super();
         this.view = param1;
         var _loc3_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < service.bagWealthVoList.length)
         {
            _loc3_.push(service.bagWealthVoList[_loc2_].clone());
            _loc2_++;
         }
         this.view.list_bag.array = _loc3_;
         this.pageBar.bindList(this.view.list_bag);
      }
      
      public function get service() : LuckTreeService
      {
         return LuckTreeService.ins;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.view.pageBarUI as IPageBar;
      }
      
      public function addNewVoArr(param1:Vector.<WealthRender>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            this.addNewVo(_loc3_,_loc4_,_loc4_ == _loc2_ - 1);
            service.addBagWealthVo(_loc3_.wealthVo);
            _loc4_++;
         }
      }
      
      private function addNewVo(param1:WealthRender, param2:int = 0, param3:Boolean = false) : void
      {
         var _loc4_:WealthVo = param1.wealthVo.clone();
         var _loc6_:WealthRender = getNullCell();
         var _loc5_:Array = this.view.list_bag.array;
         _loc5_.push(_loc4_);
         _loc4_.extraData = {};
         _loc4_.extraData["isHide"] = true;
         this.view.list_bag.array = _loc5_;
         this.pageBar.bindList(this.view.list_bag);
         this.view.list_bag.commitMeasure();
         this.iconFlyBag(param1,_loc6_,_loc4_,param2,param3);
      }
      
      public function stop() : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         if(iconFlayEffArr)
         {
            _loc2_ = iconFlayEffArr.length;
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc1_ = iconFlayEffArr[_loc4_];
               _loc1_.endPlay();
               _loc4_++;
            }
            iconFlayEffArr = [];
         }
         _loc2_ = this.view.list_bag.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.view.list_bag.array[_loc4_];
            if(_loc3_.extraData)
            {
               _loc3_.extraData["isHide"] = false;
            }
            _loc4_++;
         }
         (view as PersonTreePanel).showAllIcons(-1);
         this.view.list_bag.refresh();
      }
      
      private function iconFlyBag(param1:WealthRender, param2:WealthRender, param3:WealthVo, param4:int, param5:Boolean) : void
      {
         var _loc6_:int = ModuleMgr.ins.toGlobalPoi(view).y + 360;
         var _loc7_:IconShakeAndDropAndFlyEff = new IconShakeAndDropAndFlyEff(param1,param2);
         _loc7_.addCompleteHandler(new Handler(flyCpl,[param3,param2,this.view.list_bag.array.length - 1]));
         _loc7_.downPosY = _loc6_;
         _loc7_.delayExec = param4 * 200;
         _loc7_.exec();
         iconFlayEffArr.push(_loc7_);
      }
      
      private function getNullCell() : WealthRender
      {
         var _loc1_:Array = this.view.list_bag.array;
         var _loc3_:int = _loc1_.length % (this.view.list_bag.repeatX * this.view.list_bag.repeatY);
         var _loc2_:WealthRender = this.view.list_bag.cells[_loc3_] as WealthRender;
         return _loc2_;
      }
      
      private function flyStart(param1:WealthVo, param2:int) : void
      {
      }
      
      private function flyCpl(param1:WealthVo, param2:WealthRender, param3:int) : void
      {
         if(param1.extraData)
         {
            param1.extraData["isHide"] = false;
         }
         param2.dataSource = param2.dataSource;
         var _loc4_:int = param3 / (this.view.list_bag.repeatX * this.view.list_bag.repeatY);
         if(_loc4_ > this.view.list_bag.page)
         {
            this.pageBar.pageTo(_loc4_,false);
         }
      }
      
      private function flyCplAll() : void
      {
         this.dispatchEvent(new Event("EVT_FLY_CPL_ALL"));
      }
      
      public function order() : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc2_:int = this.view.list_bag.array.length;
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = this.view.list_bag.array[_loc5_];
            _loc3_ = ArrayUtil.findByAttrValueArr(_loc1_,["kind","sid"],[_loc4_.kind,_loc4_.sid]);
            if(_loc3_ == null)
            {
               _loc1_.push(_loc4_);
            }
            else
            {
               _loc3_.count = _loc3_.count + _loc4_.count;
            }
            _loc5_++;
         }
         this.view.list_bag.array = _loc1_;
      }
      
      public function dispose() : void
      {
         this.stop();
      }
   }
}

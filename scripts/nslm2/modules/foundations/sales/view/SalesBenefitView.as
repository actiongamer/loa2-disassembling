package nslm2.modules.foundations.sales.view
{
   import game.ui.salesModule.view.SalesBenefitViewUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcGeneralWelfareVo;
   import nslm2.modules.foundations.sales.vo.SalesBenefitVo;
   import nslm2.modules.foundations.sales.service.SalesService;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class SalesBenefitView extends SalesBenefitViewUI implements IObserver, IViewStackPage
   {
       
      
      private var model:SalesModel;
      
      private var dataArr:Array;
      
      private var tempCount:int;
      
      private var scrollIndex:int;
      
      public function SalesBenefitView()
      {
         model = SalesModel.ins;
         super();
         ObserverMgr.ins.regObserver(this);
         img_icon.skin = UrlLib.getSalesDiscountImg("img_icon");
         refreshView();
      }
      
      private function refreshView() : void
      {
         var _loc6_:* = null;
         if(model.allcount == 0 && tempCount == 0)
         {
            tempCount = Math.floor(Math.random() * 9 + 1);
         }
         model.allcount = tempCount > model.allcount?tempCount:int(model.allcount);
         list_peopleNum.dataSource = [model.allcount / 10000,model.allcount % 10000 / 1000,model.allcount % 1000 / 100,model.allcount % 100 / 10,model.allcount % 10];
         var _loc2_:Array = StcMgr.ins.getGeneralWelfareTable().array;
         dataArr = [];
         var _loc5_:int = 0;
         var _loc4_:int = 2147483647;
         var _loc1_:* = 0;
         var _loc8_:int = 0;
         var _loc7_:* = _loc2_;
         for each(var _loc3_ in _loc2_)
         {
            _loc6_ = new SalesBenefitVo();
            _loc6_.id = _loc3_.id;
            _loc6_.dropid = _loc3_.dropid;
            _loc6_.num = _loc3_.num;
            _loc6_.cardLimit = _loc3_.cardLimit;
            _loc6_.status = SalesService.ins.getStatus(_loc3_.id);
            dataArr.push(_loc6_);
            if(_loc6_.status == 3 && _loc6_.num < _loc4_)
            {
               _loc4_ = _loc6_.num;
               _loc1_ = _loc5_;
            }
            _loc5_++;
         }
         rewardList.dataSource = dataArr.sortOn(["id"],16);
         scrollIndex = _loc1_;
         rewardList.scrollTo(scrollIndex);
      }
      
      public function getFocusNotices() : Array
      {
         return ["RefreshAllCount","RefreshBenefitList"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("RefreshAllCount" !== _loc4_)
         {
            if("RefreshBenefitList" === _loc4_)
            {
               (dataArr[rewardList.selectedIndex] as SalesBenefitVo).status = 4;
               _loc3_ = rewardList.getItem(rewardList.selectedIndex) as SalesBenefitVo;
               if(_loc3_)
               {
                  _loc3_.status = 4;
               }
            }
         }
         else
         {
            refreshView();
         }
      }
      
      public function viewStackIn() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = 0;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc3_:Array = rewardList.array;
         if(_loc3_)
         {
            _loc2_ = 2147483647;
            _loc1_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = _loc3_[_loc4_] as SalesBenefitVo;
               if(_loc5_ && _loc5_.status == 3 && _loc5_.num < _loc2_)
               {
                  _loc2_ = _loc5_.num;
                  _loc1_ = _loc4_;
               }
               _loc4_++;
            }
         }
         if(_loc1_ != rewardList.startIndex)
         {
            rewardList.scrollTo(_loc1_);
         }
         this.visible = true;
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}

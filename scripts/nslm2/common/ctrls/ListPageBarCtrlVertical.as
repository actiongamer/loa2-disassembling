package nslm2.common.ctrls
{
   import com.mz.core.interFace.IDispose;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import nslm2.common.compsEffects.ListHChangePageEffectVertical;
   import com.mz.core.utils.MathUtil;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class ListPageBarCtrlVertical implements IDispose
   {
       
      
      protected var list:List;
      
      protected var pageTxt:Label;
      
      public var pageNumFunc:Function;
      
      protected var btnPrev:Button;
      
      protected var btnNext:Button;
      
      protected var btnFirst:Button;
      
      protected var btnLatest:Button;
      
      public var getDataHandler;
      
      protected var hChangePageCtrl:ListHChangePageEffectVertical;
      
      public function ListPageBarCtrlVertical(param1:List, param2:Label, param3:Button, param4:Button, param5:Button = null, param6:Button = null)
      {
         super();
         pageNumFunc = this.defaultpageNumFunc;
         this.list = param1;
         this.pageTxt = param2;
         this.btnPrev = param3;
         this.btnNext = param4;
         this.btnFirst = param5;
         this.btnLatest = param6;
         switchHandlers(true);
         this.validate();
         hChangePageCtrl = new ListHChangePageEffectVertical(this.list);
      }
      
      public function goToSelectIndex(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(param1 >= 0 && param1 < list.array.length)
         {
            _loc3_ = this.list.page;
            _loc2_ = Math.floor(param1 / (list.repeatX * list.repeatY));
            list.page = _loc2_;
            list.selectedIndex = param1;
            this.validate();
         }
      }
      
      protected function switchHandlers(param1:Boolean) : void
      {
         if(param1)
         {
            this.list.addEventListener("setDataSource",list_setDataSource);
         }
         else
         {
            this.list.removeEventListener("setDataSource",list_setDataSource);
         }
         var _loc2_:Function = !!param1?btn_onClick:null;
         if(btnPrev)
         {
            btnPrev.clickHandler = _loc2_;
         }
         if(btnNext)
         {
            btnNext.clickHandler = _loc2_;
         }
         if(btnFirst)
         {
            btnFirst.clickHandler = _loc2_;
         }
         if(btnLatest)
         {
            btnLatest.clickHandler = _loc2_;
         }
      }
      
      public function pageTo(param1:int, param2:Boolean) : void
      {
         var _loc4_:int = 0;
         if(param2)
         {
            _loc4_ = this.list.page;
            hChangePageCtrl.preChange();
         }
         var _loc3_:int = MathUtil.maxMin(param1,this.list.totalPage,0);
         this.list.page = _loc3_;
         if(param2)
         {
            if(_loc4_ != _loc3_)
            {
               if(_loc4_ < _loc3_)
               {
                  hChangePageCtrl.afterChange(7);
               }
               else
               {
                  hChangePageCtrl.afterChange(3);
               }
            }
         }
         this.validate();
      }
      
      protected function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         hChangePageCtrl.preChange();
         var _loc3_:* = param1;
         if(btnPrev !== _loc3_)
         {
            if(btnNext !== _loc3_)
            {
               if(btnFirst !== _loc3_)
               {
                  if(btnLatest === _loc3_)
                  {
                     this.list.page = this.list.totalPage - 1;
                     hChangePageCtrl.afterChange(3);
                  }
               }
               else
               {
                  this.list.page = 0;
                  hChangePageCtrl.afterChange(7);
               }
            }
            else
            {
               this.list.page = this.list.page + 1;
               hChangePageCtrl.afterChange(3);
            }
         }
         else
         {
            this.list.page = this.list.page - 1;
            hChangePageCtrl.afterChange(7);
         }
         this.validate();
      }
      
      protected function defaultpageNumFunc(param1:List, param2:Label) : void
      {
         if(param2)
         {
            if(param1.totalPage)
            {
               param2.text = param1.page + 1 + "/" + param1.totalPage;
            }
            else
            {
               param2.text = "-/-";
            }
         }
      }
      
      protected function list_setDataSource(param1:Event) : void
      {
         hChangePageCtrl.clear();
         this.validate();
      }
      
      public function validate() : void
      {
         pageNumFunc(this.list,this.pageTxt);
         if(btnPrev)
         {
            btnPrev.disabled = this.list.page <= 0;
         }
         if(btnFirst)
         {
            btnFirst.disabled = this.list.page <= 0;
         }
         if(btnNext)
         {
            btnNext.disabled = this.list.page + 1 >= this.list.totalPage;
         }
         if(btnLatest)
         {
            btnLatest.disabled = this.list.page + 1 >= this.list.totalPage;
         }
      }
      
      public function dispose() : void
      {
         if(this.list == null)
         {
            return;
         }
         if(hChangePageCtrl)
         {
            hChangePageCtrl.dispose();
            hChangePageCtrl = null;
         }
         switchHandlers(false);
         this.list = null;
         this.pageNumFunc = null;
         this.pageTxt = null;
         this.btnPrev = null;
         this.btnNext = null;
         this.btnFirst = null;
         this.btnLatest = null;
      }
   }
}

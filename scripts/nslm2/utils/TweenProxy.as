package nslm2.utils
{
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class TweenProxy extends Proxy
   {
       
      
      public var target:Object;
      
      public function TweenProxy(param1:Object)
      {
         super();
         this.target = param1;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         return this.target[param1];
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         this.target[param1] = param2;
      }
      
      override flash_proxy function hasProperty(param1:*) : Boolean
      {
         return this.target.hasOwnProperty(param1);
      }
   }
}

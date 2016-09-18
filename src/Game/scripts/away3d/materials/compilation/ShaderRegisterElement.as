package away3d.materials.compilation
{
   public class ShaderRegisterElement
   {
      
      static const COMPONENTS:Array = ["x","y","z","w","xy","xyz"];
       
      
      private var _regName:String;
      
      private var _index:int;
      
      private var _toStr:String;
      
      var _component:int;
      
      private var componetLib:Object;
      
      public function ShaderRegisterElement(param1:String, param2:int, param3:int = -1)
      {
         componetLib = {};
         super();
         _component = param3;
         _regName = param1;
         _index = param2;
         _toStr = _regName;
         if(_index >= 0)
         {
            _toStr = _toStr + _index;
         }
         if(param3 > -1)
         {
            _toStr = _toStr + ("." + COMPONENTS[param3]);
         }
      }
      
      public function toString() : String
      {
         return _toStr;
      }
      
      public function get regName() : String
      {
         return _regName;
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function getComponent(param1:String) : ShaderRegisterComponent
      {
         if(componetLib[param1] == null)
         {
            componetLib[param1] = new ShaderRegisterComponent(this,param1);
         }
         return componetLib[param1];
      }
      
      public function get x() : ShaderRegisterComponent
      {
         return getComponent("x");
      }
      
      public function get y() : ShaderRegisterComponent
      {
         return getComponent("y");
      }
      
      public function get z() : ShaderRegisterComponent
      {
         return getComponent("z");
      }
      
      public function get w() : ShaderRegisterComponent
      {
         return getComponent("w");
      }
      
      public function get xy() : ShaderRegisterComponent
      {
         return getComponent("xy");
      }
      
      public function get xz() : ShaderRegisterComponent
      {
         return getComponent("xz");
      }
      
      public function get yz() : ShaderRegisterComponent
      {
         return getComponent("yz");
      }
      
      public function get xyz() : ShaderRegisterComponent
      {
         return getComponent("xyz");
      }
   }
}

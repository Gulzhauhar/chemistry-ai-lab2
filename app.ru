import streamlit as st

# Платформа баптаулары
st.set_page_config(page_title="AI Organic Lab 34", layout="wide")

# Деректер базасы
lab_data = {
    "1. Метанның хлорлануы": {
        "reagents": ["CH4", "Cl2"], 
        "condition": "hv (жарық)", 
        "effect": "💨 HCl газы бөлінді, түссіздену", 
        "equation": "CH4 + Cl2 -> CH3Cl + HCl"
    },
    "6. Этиленнің бромдалуы": {
        "reagents": ["C2H4", "Br2"], 
        "condition": "стандартты", 
        "effect": "🟠 Қоңыр түсті бром суы түссізденді", 
        "equation": "C2H4 + Br2 -> C2H4Br2"
    },
    "11. Ацетилен алу": {
        "reagents": ["CaC2", "H2O"], 
        "condition": "стандартты", 
        "effect": "🫧 Газ қарқынды бөлінуі", 
        "equation": "CaC2 + 2H2O -> C2H2 + Ca(OH)2"
    },
    "21. Глицеринге сапалық реакция": {
        "reagents": ["Glycerol", "Cu(OH)2"], 
        "condition": "сілтілі", 
        "effect": "🟦 Ашық көк түсті ерітінді түзілді", 
        "equation": "Cu(C3H7O3)2"
    },
    "26. Күміс айна реакциясы": {
        "reagents": ["CH3CHO", "AgNO3", "NH3"], 
        "condition": "t (қыздыру)", 
        "effect": "🪞 Пробирка қабырғасында күміс қабаты", 
        "equation": "Ag"
    },
    "31. Этерификация (Эфир алу)": {
        "reagents": ["CH3COOH", "C2H5OH"], 
        "condition": "H2SO4", 
        "effect": "🍎 Жағымды жеміс иісі шықты", 
        "equation": "CH3COOC2H5"
    }
}

st.title("🧪 AI Virtual Organic Lab")
st.markdown("---")

choice = st.sidebar.selectbox("Зертханалық жұмысты таңдаңыз:", list(lab_data.keys()))

col1, col2 = st.columns([2, 1])

with col1:
    st.header("🔬 Эксперимент алаңы")
    st.info(f"Тапсырма: {choice}")
    
    user_reagents = st.multiselect("Реагенттерді таңдаңыз:", ["CH4", "Cl2", "C2H4", "Br2", "CaC2", "H2O", "Cu(OH)2", "CH3CHO", "AgNO3", "NH3", "CH3COOH", "C2H5OH", "Glycerol"])
    user_cond = st.radio("Реакция жағдайы:", ["стандартты", "hv (жарық)", "t (қыздыру)", "H2SO4 (кат)", "сілтілі"])
    
    if st.button("🧪 Реакцияны іске қосу"):
        data = lab_data[choice]
        # Реагенттердің бар-жоғын тексеру
        check_reagents = all(r in user_reagents for r in data["reagents"])
        
        if check_reagents and user_cond == data["condition"]:
            st.success(f"Нәтиже: {data['effect']}")
            st.snow()
        else:
            st.error("Қате! Реагенттерді немесе жағдайды дұрыс таңдамадыңыз.")

with col2:
    st.header("🤖 AI Тексеруші")
    user_eq = st.text_input("Өнімді немесе теңдеуді жазыңыз:")
    
    if st.button("📝 Тексеру"):
        if lab_data[choice]["equation"] in user_eq:
            st.success("Дұрыс! 5/5")
        else:
            st.warning("Қате бар. Қайта көріңіз.")

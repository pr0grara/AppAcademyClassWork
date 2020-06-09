
const partyHeader = document.getElementById('party');

const htmlGenerator = (string, htmlElement) => {
  let p = document.createElement("p");
  p.innerHTML = string;
  if (!htmlElement.children.length) {
    htmlElement.appendChild(p)
  } else {
    htmlElement.removeChild(htmlElement.children[0])
    htmlElement.appendChild(p)
  }
};

htmlGenerator('Yes it is indeed Party Time.', partyHeader);

export default htmlGenerator
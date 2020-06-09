
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = (dogs) => {
  const dogLinks = [];
  const dogList = Object.keys(dogs);
  
  dogList.forEach(dog => {
    const li = document.createElement("li");
    const a = document.createElement("a");

    a.innerHTML = dog;
    a.href = dogs[dog];

    li.classList = 'dog-link';
    li.appendChild(a);
    dogLinks.push(li);
  });
  return dogLinks
}

const attachDogLinks = () => {
  const dropDownList = document.getElementsByClassName("drop-down-dog-list")[0];
  const dogLinks = dogLinkCreator(dogs)
  dogLinks.forEach(link => dropDownList.appendChild(link))
}

attachDogLinks();

